Received: by 10.25.21.96 with SMTP id l93csp586227lfi;
        Thu, 23 Jun 2016 08:35:48 -0700 (PDT)
X-Received: by 10.200.42.43 with SMTP id k40mr43917816qtk.98.1466696147954;
        Thu, 23 Jun 2016 08:35:47 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id h3si371809qkf.92.2016.06.23.08.35.47
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 23 Jun 2016 08:35:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:37422 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bG6fT-0007bK-71
	for alex.bennee@linaro.org; Thu, 23 Jun 2016 11:35:47 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50847)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bG6b9-0002wF-T6
	for qemu-devel@nongnu.org; Thu, 23 Jun 2016 11:31:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bG6b7-0000fl-Iq
	for qemu-devel@nongnu.org; Thu, 23 Jun 2016 11:31:18 -0400
Received: from mail-vk0-x235.google.com ([2607:f8b0:400c:c05::235]:35400)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bG6b6-0000em-CY
	for qemu-devel@nongnu.org; Thu, 23 Jun 2016 11:31:17 -0400
Received: by mail-vk0-x235.google.com with SMTP id j2so111419599vkg.2
	for <qemu-devel@nongnu.org>; Thu, 23 Jun 2016 08:31:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=cOqsMtYp03nizYCDcnV5i8vAUpuZHWiiz5Rjy8sb4Jc=;
	b=K3UXPwWuOYMDjIvEyNpbhEIPy96THRhmRNt6iQSY02t8MiSlZcjNraec9gBpiXkzcf
	IKsozVJ6VV6b1MLzaJEfTzDG9dOS6u+fogZdLROvflu7ZfCPdPF2LBGHl3P8OsXz5HF6
	ppKJspPw4wbmrLOfX/UQdY0PIOSODq87M9vMY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=cOqsMtYp03nizYCDcnV5i8vAUpuZHWiiz5Rjy8sb4Jc=;
	b=My69FwdAtTgPKYgwVMSu7qRG4ZTMrdHGBLKvRa4LOCR6Cvt/0adlDbD7+kX7qWjeP9
	86x1no1ZAgoKrlZuEDQ/vZSwXLykWwi15/WHlf+8cNTWX8ou1ZMRVcaoPnS3gpH7rvUc
	S5cEB6kGR9jE+nt52Xoc7P+xpCGwcoZjgra/d9/2hfHZ6Wi7buNa3Sb9kppHl1ptMr1m
	iouoRubcrLwZ2hlwPKdgcrehjsS/yDqDPXREj1sRzd3pzDdn1b9wijP8xUG1tioh4ZWh
	Vb5Gof5u9uC4xIyoY/PxoC8bFLG5C9dQNeoDEof8QnALjf94DGvCH62yszoPjbipKdtq
	U24g==
X-Gm-Message-State: ALyK8tJRzo7cFB8j7d0+JkjHrlsH5coOtyRVP0OpGjhXRiPXjpMAqJbheKUd6ftj3+LqHYQG8PtybAjN4ULGTXzl
X-Received: by 10.176.5.3 with SMTP id 3mr15863844uax.52.1466695875515; Thu,
	23 Jun 2016 08:31:15 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.157.141 with HTTP; Thu, 23 Jun 2016 08:30:55 -0700 (PDT)
In-Reply-To: <1465552668-30084-2-git-send-email-aleksandar.markovic@rt-rk.com>
References: <1465552668-30084-1-git-send-email-aleksandar.markovic@rt-rk.com>
	<1465552668-30084-2-git-send-email-aleksandar.markovic@rt-rk.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 23 Jun 2016 16:30:55 +0100
Message-ID: <CAFEAcA8+K_nUEmGsbeOifo5aNm=nvar+81nLN0obY96UDOHf9A@mail.gmail.com>
To: Aleksandar Markovic <aleksandar.markovic@rt-rk.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::235
Subject: Re: [Qemu-devel] [PATCH v9 01/10] softfloat: Implement
 run-time-configurable meaning of signaling NaN bit
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Ethan Hunt <proljc@gmail.com>,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	QEMU Developers <qemu-devel@nongnu.org>, Alexander Graf <agraf@suse.de>,
	Blue Swirl <blauwirbel@gmail.com>, Max Filippov <jcmvbkbc@gmail.com>,
	Miodrag Dinic <miodrag.dinic@imgtec.com>, maciej.rozycki@imgtec.com,
	"qemu-ppc@nongnu.org" <qemu-ppc@nongnu.org>,
	Petar Jovanovic <petar.jovanovic@imgtec.com>,
	qemu-arm <qemu-arm@nongnu.org>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Aleksandar Markovic <aleksandar.markovic@imgtec.com>,
	Paolo Bonzini <pbonzini@redhat.com>, Guan Xuetao <gxt@mprc.pku.edu.cn>,
	Leon Alrae <leon.alrae@imgtec.com>, Aurelien Jarno <aurelien@aurel32.net>,
	Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 0FiAB1HG01BJ

On 10 June 2016 at 10:57, Aleksandar Markovic
<aleksandar.markovic@rt-rk.com> wrote:
> From: Aleksandar Markovic <aleksandar.markovic@imgtec.com>
>
> This patch modifies SoftFloat library so that it can be configured in
> run-time in relation to the meaning of signaling NaN bit, while, at the
> same time, strictly preserving its behavior on all existing platforms.

This doesn't compile:

In file included from
/home/petmay01/linaro/qemu-from-laptop/qemu/fpu/softfloat.c:106:0:
/home/petmay01/linaro/qemu-from-laptop/qemu/fpu/softfloat-specialize.h:
In function =E2=80=98commonNaNToFloat32=E2=80=99:
/home/petmay01/linaro/qemu-from-laptop/qemu/fpu/softfloat-specialize.h:398:=
9:
error: return makes integer from pointer without a cast [-Werror]
         return float32_default_nan;
         ^
In file included from
/home/petmay01/linaro/qemu-from-laptop/qemu/fpu/softfloat.c:106:0:
/home/petmay01/linaro/qemu-from-laptop/qemu/fpu/softfloat-specialize.h:
In function =E2=80=98commonNaNToFloat64=E2=80=99:
/home/petmay01/linaro/qemu-from-laptop/qemu/fpu/softfloat-specialize.h:816:=
9:
error: return makes integer from pointer without a cast [-Werror]
         return float64_default_nan;
         ^

This is because a couple of changes currently in patch 2 should
be in this patch:

@@ -391,11 +391,12 @@ static float32 commonNaNToFloat32(commonNaNT a,
float_status *status)
         return float32_default_nan(status);
     }

-    if ( mantissa )
+    if (mantissa) {
         return make_float32(
             (((uint32_t)a.sign) << 31) | 0x7F800000 | (a.high >> 41));
-    else
-        return float32_default_nan;
+    } else {
+        return float32_default_nan(status);
+    }
 }

and

@@ -807,13 +807,14 @@ static float64 commonNaNToFloat64(commonNaNT a,
float_status *status)
         return float64_default_nan(status);
     }

-    if ( mantissa )
+    if (mantissa) {
         return make_float64(
               (((uint64_t) a.sign) << 63)
             | LIT64(0x7FF0000000000000)
             | (a.high >> 12));
-    else
-        return float64_default_nan;
+    } else {
+        return float64_default_nan(status);
+    }
 }


Otherwise:
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

(As an aside, this patch reveals a bug in scripts/checkpatch.pl, which
goes into an infinite loop if you try to run it on it.)

thanks
-- PMM
