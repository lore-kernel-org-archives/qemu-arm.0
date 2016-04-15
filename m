Received: by 10.25.208.194 with SMTP id h185csp1071004lfg;
        Fri, 15 Apr 2016 01:48:40 -0700 (PDT)
X-Received: by 10.55.117.10 with SMTP id q10mr23845935qkc.103.1460710120258;
        Fri, 15 Apr 2016 01:48:40 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m10si35700603qhm.57.2016.04.15.01.48.40
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 15 Apr 2016 01:48:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:57614 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aqzQc-0007Hp-OJ
	for alex.bennee@linaro.org; Fri, 15 Apr 2016 04:48:38 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36562)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Aleksandar.Markovic@imgtec.com>) id 1aqzQa-0007Ev-7M
	for qemu-arm@nongnu.org; Fri, 15 Apr 2016 04:48:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <Aleksandar.Markovic@imgtec.com>) id 1aqzQW-0005cf-3D
	for qemu-arm@nongnu.org; Fri, 15 Apr 2016 04:48:36 -0400
Received: from mailapp01.imgtec.com ([195.59.15.196]:53498)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Aleksandar.Markovic@imgtec.com>)
	id 1aqzQV-0005c0-QA; Fri, 15 Apr 2016 04:48:32 -0400
Received: from HHMAIL01.hh.imgtec.org (unknown [10.100.10.19])
	by Websense Email with ESMTPS id 91681273AC992;
	Fri, 15 Apr 2016 09:48:24 +0100 (IST)
Received: from BADAG01.ba.imgtec.org (10.20.40.113) by HHMAIL01.hh.imgtec.org
	(10.100.10.19) with Microsoft SMTP Server (TLS) id 14.3.266.1;
	Fri, 15 Apr 2016 09:48:27 +0100
Received: from BADAG02.ba.imgtec.org ([fe80::612d:e977:c603:32d6]) by
	BADAG01.ba.imgtec.org ([fe80::8c38:df2b:fd93:33d3%14]) with mapi id
	14.03.0266.001; Fri, 15 Apr 2016 01:48:23 -0700
From: Aleksandar Markovic <Aleksandar.Markovic@imgtec.com>
To: Leon Alrae <Leon.Alrae@imgtec.com>, Aleksandar Markovic
	<aleksandar.markovic@rt-rk.com>, "qemu-devel@nongnu.org"
	<qemu-devel@nongnu.org>
Thread-Topic: [PATCH v4 1/9] softfloat: Implement run-time-configurable
	meaning of signaling NaN bit
Thread-Index: AQHRlLsD7sE3dk5nvEKtZ9tYdGK2y5+KEUSAgACoN9U=
Date: Fri, 15 Apr 2016 08:48:22 +0000
Message-ID: <EF5FA6C3467F85449672C3E735957B8591692ECC@BADAG02.ba.imgtec.org>
References: <1460465891-6142-1-git-send-email-aleksandar.markovic@rt-rk.com>
	<1460465891-6142-2-git-send-email-aleksandar.markovic@rt-rk.com>,
	<570FB7C7.7090404@imgtec.com>
In-Reply-To: <570FB7C7.7090404@imgtec.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [82.117.201.26]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 195.59.15.196
Subject: Re: [Qemu-arm] [PATCH v4 1/9] softfloat: Implement
 run-time-configurable meaning of signaling NaN bit
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: "proljc@gmail.com" <proljc@gmail.com>,
	"kbastian@mail.uni-paderborn.de" <kbastian@mail.uni-paderborn.de>,
	"mark.cave-ayland@ilande.co.uk" <mark.cave-ayland@ilande.co.uk>,
	"agraf@suse.de" <agraf@suse.de>,
	Maciej Rozycki <Maciej.Rozycki@imgtec.com>,
	Petar Jovanovic <Petar.Jovanovic@imgtec.com>,
	"blauwirbel@gmail.com" <blauwirbel@gmail.com>,
	"jcmvbkbc@gmail.com" <jcmvbkbc@gmail.com>,
	Miodrag Dinic <Miodrag.Dinic@imgtec.com>,
	"qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
	"qemu-ppc@nongnu.org" <qemu-ppc@nongnu.org>,
	"pbonzini@redhat.com" <pbonzini@redhat.com>,
	"gxt@mprc.pku.edu.cn" <gxt@mprc.pku.edu.cn>,
	"afaerber@suse.de" <afaerber@suse.de>,
	"aurelien@aurel32.net" <aurelien@aurel32.net>,
	"rth@twiddle.net" <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: z4OqaVXXMPjD

Agreed. This looks much better, and is simpler and faster. Though, it looks=
 to me that "fst" should be called "status" instead (just not to break cons=
istency throughout SoftFloat library and in other places of assigning name =
"status" to the last argument of any function if its type is float_status*)=
. If you agree, I am going to replace name "fst" with name "status" in the =
code that you provided, otherwise as-is.
________________________________________
From: Leon Alrae
Sent: Thursday, April 14, 2016 8:31 AM
To: Aleksandar Markovic; qemu-devel@nongnu.org
Cc: proljc@gmail.com; kbastian@mail.uni-paderborn.de; mark.cave-ayland@ilan=
de.co.uk; agraf@suse.de; blauwirbel@gmail.com; jcmvbkbc@gmail.com; Aleksand=
ar Markovic; qemu-arm@nongnu.org; qemu-ppc@nongnu.org; Petar Jovanovic; pbo=
nzini@redhat.com; Miodrag Dinic; edgar.iglesias@gmail.com; gxt@mprc.pku.edu=
.cn; afaerber@suse.de; aurelien@aurel32.net; rth@twiddle.net; Maciej Rozyck=
i
Subject: Re: [PATCH v4 1/9] softfloat: Implement run-time-configurable mean=
ing of signaling NaN bit

On 12/04/2016 13:58, Aleksandar Markovic wrote:
> @@ -3200,11 +3200,17 @@ FLOAT_RINT(rint_d, 64)
>  #define FLOAT_CLASS_POSITIVE_ZERO      0x200
>
>  #define FLOAT_CLASS(name, bits)                                      \
> -uint ## bits ## _t helper_float_ ## name (uint ## bits ## _t arg)    \
> +uint ## bits ## _t helper_float_ ## name (CPUMIPSState *env,         \
> +                         uint ## bits ## _t arg, uint32_t is_msa)    \
>  {                                                                    \
> -    if (float ## bits ## _is_signaling_nan(arg)) {                   \
> +    float_status* fst;                                               \
> +                                                                     \
> +    fst =3D (is_msa =3D=3D 1) ?                                         =
   \
> +        &env->active_tc.msa_fp_status : &env->active_fpu.fp_status;  \
> +                                                                     \
> +    if (float ## bits ## _is_signaling_nan(arg, fst)) {              \
>          return FLOAT_CLASS_SIGNALING_NAN;                            \
> -    } else if (float ## bits ## _is_quiet_nan(arg)) {                \
> +    } else if (float ## bits ## _is_quiet_nan(arg, fst)) {           \
>          return FLOAT_CLASS_QUIET_NAN;                                \
>      } else if (float ## bits ## _is_neg(arg)) {                      \
>          if (float ## bits ## _is_infinity(arg)) {                    \

Let's make it a common function which takes float_status passed from FPU an=
d
MSA helpers and avoid is_msa:


 #define FLOAT_CLASS(name, bits)                                      \
-uint ## bits ## _t helper_float_ ## name (uint ## bits ## _t arg)    \
+uint ## bits ## _t float_ ## name (uint ## bits ## _t arg,           \
+                                   float_status *fst)                \
 {                                                                    \
-    if (float ## bits ## _is_signaling_nan(arg)) {                   \
+    if (float ## bits ## _is_signaling_nan(arg, fst)) {              \
         return FLOAT_CLASS_SIGNALING_NAN;                            \
-    } else if (float ## bits ## _is_quiet_nan(arg)) {                \
+    } else if (float ## bits ## _is_quiet_nan(arg, fst)) {           \
         return FLOAT_CLASS_QUIET_NAN;                                \
     } else if (float ## bits ## _is_neg(arg)) {                      \
         if (float ## bits ## _is_infinity(arg)) {                    \
@@ -3227,6 +3228,12 @@ uint ## bits ## _t helper_float_ ## name (uint ## bi=
ts ## _t arg)    \
             return FLOAT_CLASS_POSITIVE_NORMAL;                      \
         }                                                            \
     }                                                                \
+}                                                                    \
+                                                                     \
+uint ## bits ## _t helper_float_ ## name (CPUMIPSState *env,         \
+                                          uint ## bits ## _t arg)    \
+{                                                                    \
+    return float_ ## name(arg, &env->active_fpu.fp_status);          \
 }

 FLOAT_CLASS(class_s, 32)


And in MSA:


+    float_status *status =3D &env->active_tc.msa_fp_status;
     if (df =3D=3D DF_WORD) {
-        pwd->w[0] =3D helper_float_class_s(pws->w[0]);
-        pwd->w[1] =3D helper_float_class_s(pws->w[1]);
-        pwd->w[2] =3D helper_float_class_s(pws->w[2]);
-        pwd->w[3] =3D helper_float_class_s(pws->w[3]);
+        pwd->w[0] =3D float_class_s(pws->w[0], status);
+        pwd->w[1] =3D float_class_s(pws->w[1], status);
+        pwd->w[2] =3D float_class_s(pws->w[2], status);
+        pwd->w[3] =3D float_class_s(pws->w[3], status);
     } else {
-        pwd->d[0] =3D helper_float_class_d(pws->d[0]);
-        pwd->d[1] =3D helper_float_class_d(pws->d[1]);
+        pwd->d[0] =3D float_class_d(pws->d[0], status);
+        pwd->d[1] =3D float_class_d(pws->d[1], status);
     }


Thanks,
Leon=
