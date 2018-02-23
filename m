Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id 11sm1446516wmp.36.2018.02.23.01.45.47
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 23 Feb 2018 01:45:47 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTPS id 7A8613E004E;
	Fri, 23 Feb 2018 09:45:47 +0000 (GMT)
References: <20180208173157.24705-1-alex.bennee@linaro.org> <20180208173157.24705-33-alex.bennee@linaro.org> <7ec2273c-a81a-eaa6-ef10-d229ae06e0cf@linaro.org>
User-agent: mu4e 1.1.0; emacs 26.0.91
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
Subject: Re: [Qemu-devel] [PATCH v2 32/32] arm/translate-a64: add all single op FP16 to handle_fp_1src_half
In-reply-to: <7ec2273c-a81a-eaa6-ef10-d229ae06e0cf@linaro.org>
Date: Fri, 23 Feb 2018 09:45:47 +0000
Message-ID: <87fu5s9gz8.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: QzZoKcZyfyt3


Richard Henderson <richard.henderson@linaro.org> writes:

> On 02/08/2018 09:31 AM, Alex Benn=C3=A9e wrote:
>> This includes FMOV, FABS, FNEG, FSQRT and  FRINT[NPMZAXI]. We re-use
>> existing helpers to achieve this.
>>
>> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>> ---
>>  target/arm/translate-a64.c | 72 +++++++++++++++++++++++++++++++++++++++=
+++++++
>>  1 file changed, 72 insertions(+)
>>
>> diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
>> index 92adf43a89..265bfb14d0 100644
>> --- a/target/arm/translate-a64.c
>> +++ b/target/arm/translate-a64.c
>> @@ -4508,6 +4508,66 @@ static void disas_fp_csel(DisasContext *s, uint32=
_t insn)
>>      tcg_temp_free_i64(t_true);
>>  }
>>
>> +/* Floating-point data-processing (1 source) - half precision */
>> +static void handle_fp_1src_half(DisasContext *s, int opcode, int rd, in=
t rn)
>> +{
>> +    TCGv_ptr fpst =3D NULL;
>> +    TCGv_i32 tcg_op;
>> +    TCGv_i32 tcg_res;
>> +
>> +    tcg_op =3D read_fp_sreg(s, rn);
>> +    tcg_res =3D tcg_temp_new_i32();
>> +
>> +    switch (opcode) {
>> +    case 0x0: /* FMOV */
>> +        tcg_gen_mov_i32(tcg_res, tcg_op);
>> +        break;
>> +    case 0x1: /* FABS */
>> +        gen_helper_advsimd_absh(tcg_res, tcg_op);
>> +        break;
>> +    case 0x2: /* FNEG */
>> +        tcg_gen_xori_i32(tcg_res, tcg_op, 0x8000);
>> +        break;
>> +    case 0x3: /* FSQRT */
>> +        gen_helper_sqrt_f16(tcg_res, tcg_op, cpu_env);
>> +        break;
>> +    case 0x8: /* FRINTN */
>> +    case 0x9: /* FRINTP */
>> +    case 0xa: /* FRINTM */
>> +    case 0xb: /* FRINTZ */
>> +    case 0xc: /* FRINTA */
>> +    {
>> +        TCGv_i32 tcg_rmode =3D tcg_const_i32(arm_rmode_to_sf(opcode & 7=
));
>> +        fpst =3D get_fpstatus_ptr(true);
>> +
>> +        gen_helper_set_rmode(tcg_rmode, tcg_rmode, fpst);
>> +        gen_helper_advsimd_rinth(tcg_res, tcg_op, fpst);
>> +
>> +        gen_helper_set_rmode(tcg_rmode, tcg_rmode, fpst);
>> +        tcg_temp_free_i32(tcg_rmode);
>> +        break;
>> +    }
>> +    case 0xe: /* FRINTX */
>> +        fpst =3D get_fpstatus_ptr(true);
>> +        gen_helper_advsimd_rinth_exact(tcg_res, tcg_op, fpst);
>> +        break;
>> +    case 0xf: /* FRINTI */
>> +        fpst =3D get_fpstatus_ptr(true);
>> +        gen_helper_advsimd_rinth(tcg_res, tcg_op, fpst);
>> +        break;
>> +    default:
>> +        abort();
>> +    }
>> +
>> +    write_fp_sreg(s, rd, tcg_res);
>
> Some of these helpers will zero-extend from 16 bits, but at least a few w=
on't
> -- notably fmov and fneg.  I wonder if it wouldn't be best to have a
> write_fp_hreg.

I fixed this up by using read_vec_element to load the value.

--
Alex Benn=C3=A9e
