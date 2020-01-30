Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp1931677lfp;
        Thu, 30 Jan 2020 06:04:01 -0800 (PST)
X-Google-Smtp-Source: APXvYqybRTzuuWvUvtYnuPevf5I2apVYg6nSDU62Ayx+oAqh59KExJ2a0RUeCdAI+FIQgnAiPDiD
X-Received: by 2002:a05:6214:c3:: with SMTP id f3mr4533481qvs.226.1580393041474;
        Thu, 30 Jan 2020 06:04:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1580393041; cv=none;
        d=google.com; s=arc-20160816;
        b=RkKHuaW9yVGK6m0Pm57RRQnCwPTu6s4w0nQ3KCKVhTK/GHCW1E40eYkv7ykQvDtNSb
         AaT6C88mGlNbTCWuciyrfhOE4wL2Xdq8JBFmkqWxnkwBvcdMunVmm2y4sYNgvLhD1QWk
         mZsd65ERYYhaOfL/nxTWXUefWdHZtGlFklPxk39bwdUeb+8lPVrNAwGBVao1uhxiDir1
         k/jYdwfCmJ0D2Zf0CcRWgvwJ5KeaFucYw50tHDpckIwFwCCwBMYWSyHMNd3/WxVZvK/O
         zPIa7O660N/C7mDyXjrGxSSLHlB7fPh/HckQsoXrHZBFxNOzuft2etcyeUWB5toMtn6k
         lx9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:content-transfer-encoding:list-subscribe:list-help
         :list-post:list-archive:list-unsubscribe:list-id:precedence:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=zt1yrKlNQnkXUf5daffU6HjGESuEkQfitclpy+UPy0Q=;
        b=o4IpN0zvTOjvbGUTVGUAq6hT7XTGl2HSaClKO6l+40BTi/jO17GjMw673d4M/bYCJx
         wyehQYWmMbaifw+N+hWVEi/j9VFCNaB8DUwQQ2QlSkuDVUlGmq11nhe94EAQMsk80t14
         yVrrZn8WInrBICCTBrEGTfEuwR1YZfHqE5sKW5HJcUdL44jb0H/97G3mItI/JbPy2a6q
         8ErA9F9IsFsXl+LGk7cbMRY/l18kUt4+jGt+H/EU4yY4dhY/A1vzlUToChkk79zqLgqj
         tLjtYIQBwYMmlMHnCHcjYr1u0tVwyAxaWTjyjWRyEtCzoy4i9KpS6ZgNwT7ZBVqLtzCy
         YtWg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@linaro.org header.s=google header.b=warS5U3j;
       spf=pass (google.com: domain of kvmarm-bounces@lists.cs.columbia.edu designates 128.59.11.253 as permitted sender) smtp.mailfrom=kvmarm-bounces@lists.cs.columbia.edu;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <kvmarm-bounces@lists.cs.columbia.edu>
Received: from mm01.cs.columbia.edu (mm01.cs.columbia.edu. [128.59.11.253])
        by mx.google.com with ESMTP id bl1si4000283qvb.90.2020.01.30.06.03.59;
        Thu, 30 Jan 2020 06:04:01 -0800 (PST)
Received-SPF: pass (google.com: domain of kvmarm-bounces@lists.cs.columbia.edu designates 128.59.11.253 as permitted sender) client-ip=128.59.11.253;
Authentication-Results: mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@linaro.org header.s=google header.b=warS5U3j;
       spf=pass (google.com: domain of kvmarm-bounces@lists.cs.columbia.edu designates 128.59.11.253 as permitted sender) smtp.mailfrom=kvmarm-bounces@lists.cs.columbia.edu;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost (localhost [127.0.0.1])
	by mm01.cs.columbia.edu (Postfix) with ESMTP id 0130A4A800;
	Thu, 30 Jan 2020 09:03:59 -0500 (EST)
X-Virus-Scanned: at lists.cs.columbia.edu
X-Spam-Flag: NO
X-Spam-Score: 0.909
X-Spam-Level: 
X-Spam-Status: No, score=0.909 required=6.1 tests=[BAYES_00=-1.9,
	DKIM_SIGNED=0.1, DNS_FROM_AHBL_RHSBL=2.699,
	RCVD_IN_DNSWL_NONE=-0.0001, T_DKIM_INVALID=0.01] autolearn=no
Authentication-Results: mm01.cs.columbia.edu (amavisd-new); dkim=softfail
	(fail, message has been altered) header.i=@linaro.org
Received: from mm01.cs.columbia.edu ([127.0.0.1])
	by localhost (mm01.cs.columbia.edu [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ni5A9vUBOMVZ; Thu, 30 Jan 2020 09:03:57 -0500 (EST)
Received: from mm01.cs.columbia.edu (localhost [127.0.0.1])
	by mm01.cs.columbia.edu (Postfix) with ESMTP id E51774A968;
	Thu, 30 Jan 2020 09:03:57 -0500 (EST)
Received: from localhost (localhost [127.0.0.1])
 by mm01.cs.columbia.edu (Postfix) with ESMTP id 436E04A800
 for <kvmarm@lists.cs.columbia.edu>; Thu, 30 Jan 2020 09:03:57 -0500 (EST)
X-Virus-Scanned: at lists.cs.columbia.edu
Received: from mm01.cs.columbia.edu ([127.0.0.1])
 by localhost (mm01.cs.columbia.edu [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oSA3q+DOZAlc for <kvmarm@lists.cs.columbia.edu>;
 Thu, 30 Jan 2020 09:03:56 -0500 (EST)
Received: from mail-oi1-f196.google.com (mail-oi1-f196.google.com
 [209.85.167.196])
 by mm01.cs.columbia.edu (Postfix) with ESMTPS id 161924A542
 for <kvmarm@lists.cs.columbia.edu>; Thu, 30 Jan 2020 09:03:56 -0500 (EST)
Received: by mail-oi1-f196.google.com with SMTP id b18so3608835oie.2
 for <kvmarm@lists.cs.columbia.edu>; Thu, 30 Jan 2020 06:03:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+iZsjgsZakLtp6vowX2UviTy1HwcCzzv58SPakeE/f0=;
 b=warS5U3jI+nfBBZmMjN08U3zX3wbr/EKi7+YEZsJGrKnozxfcDtDdi0vcH40pW8WyR
 xQ+1AQ4Ff7t7oM2xo1oV7qsKQYJxiYFQepPpwKR4efAO2vwGlkq7FvBku3WYhlaBrDz3
 zAhpoSqtFV07ErIufrfOEatB/PasVrVs56La7TuY1bM47GsPW8V6WUxtQqqTJlpOf5K4
 nO3ipDPX3TS7+1Y6sbCxkz2ojEKjMydqOe7DNmrpH5jigJfDnd9VmHIKplRA2KluT4Dt
 pjgC/SHVTxNTi2nXMVYMnhKWFkEPwn0lv+eY51pVFZKumES5ffItoGkJh4WzYpbIz1RD
 dllA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+iZsjgsZakLtp6vowX2UviTy1HwcCzzv58SPakeE/f0=;
 b=F08mH7i7QVnhBEotw8FkLiigFZO8tjIODlpkDzhBTJdl7eeixI/NotRWB4ziJwlkPB
 uqsUGox4ulY+GeFR3VAjTnl2SEMMBuiBiDrOAXrbQB78IqCGxWwWXZtes+8lGqDDxLSZ
 mxg/iMbPJdauG28V3ENoI/9uadPTWIYKPRXOep8oo4hztDLrQjyfy3h+VRwkhEfraCLo
 yP+5XKyS94xtCsWWQfOUgqsOOLDQSxCyQE2N5U+vNtPro7hJ0JOw0r9UjWpgFEeT2MmH
 a/i6MpjvGetpnlztQQRyU/+kJM1Punq+CGSyqoKRPXy0kAk+Xhl+ZMuZqsNZDRd/NQKb
 RmBQ==
X-Gm-Message-State: APjAAAUxUXfIIQPzZctjKQI4J1VL7EDGldLRPrc1SXLaqPq4OHwsBwx2
 RYi0bhP/XzYlJcaJhi7UI+ScWA4sCXjYV4Yk99jWVw==
X-Received: by 2002:aca:3d7:: with SMTP id 206mr2953620oid.98.1580393035139;
 Thu, 30 Jan 2020 06:03:55 -0800 (PST)
MIME-Version: 1.0
References: <20200119133051.642-1-yuzenghui@huawei.com>
In-Reply-To: <20200119133051.642-1-yuzenghui@huawei.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 30 Jan 2020 14:03:44 +0000
Message-ID: <CAFEAcA8igVrEjyChLmbkeQb+gXYMCVhtgGwrNNKrZNaKKSp04w@mail.gmail.com>
Subject: Re: [PATCH] hw/intc/arm_gicv3_kvm: Stop wrongly programming
 GICR_PENDBASER.PTZ bit
To: Zenghui Yu <yuzenghui@huawei.com>
Cc: Marc Zyngier <maz@kernel.org>, QEMU Developers <qemu-devel@nongnu.org>,
 qemu-arm <qemu-arm@nongnu.org>, kvmarm@lists.cs.columbia.edu
X-BeenThere: kvmarm@lists.cs.columbia.edu
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: Where KVM/ARM decisions are made <kvmarm.lists.cs.columbia.edu>
List-Unsubscribe: <https://lists.cs.columbia.edu/mailman/options/kvmarm>,
 <mailto:kvmarm-request@lists.cs.columbia.edu?subject=unsubscribe>
List-Archive: <https://lists.cs.columbia.edu/pipermail/kvmarm>
List-Post: <mailto:kvmarm@lists.cs.columbia.edu>
List-Help: <mailto:kvmarm-request@lists.cs.columbia.edu?subject=help>
List-Subscribe: <https://lists.cs.columbia.edu/mailman/listinfo/kvmarm>,
 <mailto:kvmarm-request@lists.cs.columbia.edu?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kvmarm-bounces@lists.cs.columbia.edu
Sender: kvmarm-bounces@lists.cs.columbia.edu
X-TUID: HsXhii8FeppR

On Sun, 19 Jan 2020 at 13:32, Zenghui Yu <yuzenghui@huawei.com> wrote:
>
> If LPIs are disabled, KVM will just ignore the GICR_PENDBASER.PTZ bit when
> restoring GICR_CTLR.  Setting PTZ here makes littlt sense in "reduce GIC
> initialization time".
>
> And what's worse, PTZ is generally programmed by guest to indicate to the
> Redistributor whether the LPI Pending table is zero when enabling LPIs.
> If migration is triggered when the PTZ has just been cleared by guest (and
> before enabling LPIs), we will see PTZ==1 on the destination side, which
> is not as expected.  Let's just drop this hackish userspace behavior.
>
> Also take this chance to refine the comment a bit.

I pulled up the original code-review discussion where this code
was added:
https://lists.gnu.org/archive/html/qemu-devel/2015-10/msg05889.html

It looks like the original reason for adding it was that the
GICR_PENDBASER.PTZ bit is write-only, and so there's no way for
the migration code in QEMU to accurately restore it on the
destination end of a migration. So Pavel picked a heuristic
for guessing what the right value of the PTZ bit was.

It sounds like the penalty if userspace sets the bit to 0
always on a migration is not significant, so I guess that
just setting this bit to 0 always is an OK thing to do (as you
say, there's a window in the existing implementation where
we do the wrong thing sometimes if migration happens at the
wrong time, because the current code's heuristic can
sometimes fail in the wrong direction).

Applied to target-arm.next.

thanks
-- PMM
_______________________________________________
kvmarm mailing list
kvmarm@lists.cs.columbia.edu
https://lists.cs.columbia.edu/mailman/listinfo/kvmarm
