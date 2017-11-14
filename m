Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id h66sm8388639wmd.11.2017.11.14.02.06.25
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 14 Nov 2017 02:06:25 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTPS id AD5433E019C;
	Tue, 14 Nov 2017 10:06:24 +0000 (GMT)
References: <20171004184325.24157-1-richard.henderson@linaro.org> <20171004184325.24157-7-richard.henderson@linaro.org> <87shdi9l05.fsf@linaro.org> <e8bb9454-bdbb-34ce-edb6-df31002fbb9a@linaro.org>
User-agent: mu4e 1.0-alpha2; emacs 26.0.90
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Subject: Re: [Qemu-arm] [PATCH v1 06/12] target/arm: Decode aa32 armv8.1 three same
In-reply-to: <e8bb9454-bdbb-34ce-edb6-df31002fbb9a@linaro.org>
Date: Tue, 14 Nov 2017 10:06:24 +0000
Message-ID: <87lgj99ntr.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: 2DUftulMyvx3


Richard Henderson <richard.henderson@linaro.org> writes:

> On 11/13/2017 05:55 PM, Alex Benn=C3=A9e wrote:
>>> +        case NEON_3R_VFM_VQRDMLSH:
>>> +            if (!u) {
>>> +                /* VFM, VFMS */
>>> +                if ((5 & (1 << size)) =3D=3D 0) {
>>> +                    return 1;
>>> +                }
>>> +                break;
>>> +            }
>>> +            /* VQRDMLSH */
>>> +            switch (size) {
>>> +            case 1:
>>> +                fn_gvec_ptr =3D gen_helper_gvec_qrdmlsh_s16;
>>> +                break;
>>> +            case 2:
>>> +                fn_gvec_ptr =3D gen_helper_gvec_qrdmlsh_s32;
>>> +                break;
>>> +            default:
>>> +                return 1;
>>> +            }
>>> +            goto do_vqrdmlx;
>> Could we not take the opportunity to re-factor out the common bit rather
>> than make this mega
>
> What, specifically, did you have in mind?

Something like:

translate: use helper to avoid goto shenanigans

1 file changed, 18 insertions(+), 17 deletions(-)
target/arm/translate.c | 35 ++++++++++++++++++-----------------

modified   target/arm/translate.c
@@ -5576,6 +5576,20 @@ static const uint8_t neon_2rm_sizes[] =3D {
     [NEON_2RM_VCVT_UF] =3D 0x4,
 };

+/* expand v8.1 simd helper */
+static int do_qrdml(DisasContext *s, gen_helper_gvec_3_ptr *fn, int q, int=
 rd, int rn, int rm)
+{
+    if (arm_dc_feature(s, ARM_FEATURE_V8_1_SIMD)) {
+        int opr_sz =3D (1 + q) * 8;
+        tcg_gen_gvec_3_ptr(vfp_reg_offset(1, rd),
+                           vfp_reg_offset(1, rn),
+                           vfp_reg_offset(1, rm), cpu_env,
+                           opr_sz, opr_sz, 0, fn);
+        return 0;
+    }
+    return 1;
+}
+
 /* Translate a NEON data processing instruction.  Return nonzero if the
    instruction is invalid.
    We process data in a mixture of 32-bit and 64-bit chunks.
@@ -5583,7 +5597,6 @@ static const uint8_t neon_2rm_sizes[] =3D {

 static int disas_neon_data_insn(DisasContext *s, uint32_t insn)
 {
-    void (*fn_gvec_ptr)(TCGv_ptr, TCGv_ptr, TCGv_ptr, TCGv_ptr, TCGv_i32);
     int op;
     int q;
     int rd, rn, rm;
@@ -5678,24 +5691,13 @@ static int disas_neon_data_insn(DisasContext *s, ui=
nt32_t insn)
             /* VQRDMLAH */
             switch (size) {
             case 1:
-                fn_gvec_ptr =3D gen_helper_gvec_qrdmlah_s16;
-                break;
+                return do_qrdml(s, gen_helper_gvec_qrdmlah_s16, q, rd, rn,=
 rm);
             case 2:
-                fn_gvec_ptr =3D gen_helper_gvec_qrdmlah_s32;
+                return do_qrdml(s, gen_helper_gvec_qrdmlah_s32, q, rd, rn,=
 rm);
                 break;
             default:
                 return 1;
             }
-        do_vqrdmlx:
-            if (arm_dc_feature(s, ARM_FEATURE_V8_1_SIMD)) {
-                int opr_sz =3D (1 + q) * 8;
-                tcg_gen_gvec_3_ptr(vfp_reg_offset(1, rd),
-                                   vfp_reg_offset(1, rn),
-                                   vfp_reg_offset(1, rm), cpu_env,
-                                   opr_sz, opr_sz, 0, fn_gvec_ptr);
-                return 0;
-            }
-            return 1;

         case NEON_3R_VFM_VQRDMLSH:
             if (!u) {
@@ -5708,15 +5710,14 @@ static int disas_neon_data_insn(DisasContext *s, ui=
nt32_t insn)
             /* VQRDMLSH */
             switch (size) {
             case 1:
-                fn_gvec_ptr =3D gen_helper_gvec_qrdmlsh_s16;
+                return do_qrdml(s, gen_helper_gvec_qrdmlsh_s16, q, rd, rn,=
 rm);
                 break;
             case 2:
-                fn_gvec_ptr =3D gen_helper_gvec_qrdmlsh_s32;
+                return do_qrdml(s, gen_helper_gvec_qrdmlsh_s32, q, rd, rn,=
 rm);
                 break;
             default:
                 return 1;
             }
-            goto do_vqrdmlx;
         }
         if (size =3D=3D 3 && op !=3D NEON_3R_LOGIC) {
             /* 64-bit element instructions. */


--
Alex Benn=C3=A9e
