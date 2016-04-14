Received: by 10.25.208.194 with SMTP id h185csp679871lfg;
        Thu, 14 Apr 2016 08:32:38 -0700 (PDT)
X-Received: by 10.140.39.138 with SMTP id v10mr18759588qgv.82.1460647958384;
        Thu, 14 Apr 2016 08:32:38 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 135si32848245qhs.48.2016.04.14.08.32.38
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 14 Apr 2016 08:32:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:41788 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aqjG1-00032E-SU
	for alex.bennee@linaro.org; Thu, 14 Apr 2016 11:32:37 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33546)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Leon.Alrae@imgtec.com>) id 1aqjEx-00019f-F5
	for qemu-arm@nongnu.org; Thu, 14 Apr 2016 11:31:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <Leon.Alrae@imgtec.com>) id 1aqjEt-0003Kv-87
	for qemu-arm@nongnu.org; Thu, 14 Apr 2016 11:31:31 -0400
Received: from mailapp01.imgtec.com ([195.59.15.196]:38944)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Leon.Alrae@imgtec.com>)
	id 1aqjEt-0003JV-1e; Thu, 14 Apr 2016 11:31:27 -0400
Received: from hhmail02.hh.imgtec.org (unknown [10.100.10.20])
	by Websense Email with ESMTPS id 27766420500E7;
	Thu, 14 Apr 2016 16:31:16 +0100 (IST)
Received: from [192.168.169.6] (192.168.169.6) by hhmail02.hh.imgtec.org
	(10.100.10.20) with Microsoft SMTP Server (TLS) id 14.3.266.1;
	Thu, 14 Apr 2016 16:31:19 +0100
Message-ID: <570FB7C7.7090404@imgtec.com>
Date: Thu, 14 Apr 2016 16:31:19 +0100
From: Leon Alrae <leon.alrae@imgtec.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64;
	rv:24.0) Gecko/20100101 Thunderbird/24.5.0
MIME-Version: 1.0
To: Aleksandar Markovic <aleksandar.markovic@rt-rk.com>,
	<qemu-devel@nongnu.org>
References: <1460465891-6142-1-git-send-email-aleksandar.markovic@rt-rk.com>
	<1460465891-6142-2-git-send-email-aleksandar.markovic@rt-rk.com>
In-Reply-To: <1460465891-6142-2-git-send-email-aleksandar.markovic@rt-rk.com>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [192.168.169.6]
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
Cc: proljc@gmail.com, kbastian@mail.uni-paderborn.de,
	mark.cave-ayland@ilande.co.uk, agraf@suse.de,
	maciej.rozycki@imgtec.com, petar.jovanovic@imgtec.com,
	blauwirbel@gmail.com, jcmvbkbc@gmail.com,
	aleksandar.markovic@imgtec.com, qemu-arm@nongnu.org,
	qemu-ppc@nongnu.org, miodrag.dinic@imgtec.com,
	pbonzini@redhat.com, gxt@mprc.pku.edu.cn, afaerber@suse.de,
	aurelien@aurel32.net, rth@twiddle.net
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: CghxMoiRFrT0

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
> +    fst = (is_msa == 1) ?                                            \
> +        &env->active_tc.msa_fp_status : &env->active_fpu.fp_status;  \
> +                                                                     \
> +    if (float ## bits ## _is_signaling_nan(arg, fst)) {              \
>          return FLOAT_CLASS_SIGNALING_NAN;                            \
> -    } else if (float ## bits ## _is_quiet_nan(arg)) {                \
> +    } else if (float ## bits ## _is_quiet_nan(arg, fst)) {           \
>          return FLOAT_CLASS_QUIET_NAN;                                \
>      } else if (float ## bits ## _is_neg(arg)) {                      \
>          if (float ## bits ## _is_infinity(arg)) {                    \

Let's make it a common function which takes float_status passed from FPU and
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
@@ -3227,6 +3228,12 @@ uint ## bits ## _t helper_float_ ## name (uint ## bits ## _t arg)    \
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


+    float_status *status = &env->active_tc.msa_fp_status;
     if (df == DF_WORD) {
-        pwd->w[0] = helper_float_class_s(pws->w[0]);
-        pwd->w[1] = helper_float_class_s(pws->w[1]);
-        pwd->w[2] = helper_float_class_s(pws->w[2]);
-        pwd->w[3] = helper_float_class_s(pws->w[3]);
+        pwd->w[0] = float_class_s(pws->w[0], status);
+        pwd->w[1] = float_class_s(pws->w[1], status);
+        pwd->w[2] = float_class_s(pws->w[2], status);
+        pwd->w[3] = float_class_s(pws->w[3], status);
     } else {
-        pwd->d[0] = helper_float_class_d(pws->d[0]);
-        pwd->d[1] = helper_float_class_d(pws->d[1]);
+        pwd->d[0] = float_class_d(pws->d[0], status);
+        pwd->d[1] = float_class_d(pws->d[1], status);
     }


Thanks,
Leon
