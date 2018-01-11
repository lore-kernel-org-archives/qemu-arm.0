Received: by 10.28.173.206 with SMTP id w197csp871435wme;
        Thu, 11 Jan 2018 10:46:14 -0800 (PST)
X-Google-Smtp-Source: ACJfBotQlRgU7ybuE08OtRcTJld5LmNjVJCDMpM47BUJlhPtx/925i33NEcgniIZre/7D3tirEj7
X-Received: by 10.129.80.9 with SMTP id e9mr11595643ywb.304.1515696374760;
        Thu, 11 Jan 2018 10:46:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1515696374; cv=none;
        d=google.com; s=arc-20160816;
        b=qjOnstzQjDIpfONuRp/CHEBLOLqJbP/dHj+A8XiI5VGm8A1mzgMUVJx9ohspboE7kf
         Tf5DdylfEIvIOMUmhwtoPO42DLVPZnmYivbU3ITmXLYQb00p6Ia3tZiX7E72CMeqMaF7
         tRRseUF0WJKvj3Q/2z9ef/K1aXKkSHNzxBbz/2jN0y8iSCO9ARCoqChtAGtt8DLdjOkB
         Bs0dd7fs72eWMoBtmCkl2gYsfRc/OE0abXNCbbMNWrX2zrCNRv/AUhJgv3zR/eyYC6Jy
         kDmpY61VYOdGqV3xsx9xch5fT4TJB4JnuSstpHJ7WHBAb/8PxfNDWbPirb/BjdYZYe0I
         b5TA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=R3sOfJh4T5ELFL3RDffTUMpRAsip4a95hRNK2IhP+ew=;
        b=F73RmZTyHDAxi6nO86Y2172AEeO/WyfQxftFCW8LswE6O5GWdNB5CSWfYn6Gp7fMnx
         fgs2GDI39OFj28Vm40z1KQNkRk5Lw1dTwK4nsWnomG27HrWBtZcnHRt1T6CDlZzTUJUQ
         hor29hlzoZ9cdvwNfgc0lVh7K8pzrvWRLlqyiEWmr3lKg5bBHtj86HNSCOYEJ8Wf7jhk
         fvVEVr7ygLztiHCS7bP/PF8Yxh3G7sFBT7+9iMFw7OPX9mkVWAq5UiH7RhtsWcWnwqLN
         n1ja/ORAlh25zJOF0Dl9H2GJgWLOESWwjEhzVD6znUdcUDf8KD6vJCcHRnQptvIND58x
         31Uw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=iRXmpLPR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id b124si4178906ybh.621.2018.01.11.10.46.14
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 11 Jan 2018 10:46:14 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=iRXmpLPR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:33849 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eZhri-0005jT-7Y
	for alex.bennee@linaro.org; Thu, 11 Jan 2018 13:46:14 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56441)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1eZhrV-0005hu-6A
	for qemu-arm@nongnu.org; Thu, 11 Jan 2018 13:46:03 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1eZhrU-0007MM-C1
	for qemu-arm@nongnu.org; Thu, 11 Jan 2018 13:46:01 -0500
Received: from mail-ot0-x243.google.com ([2607:f8b0:4003:c0f::243]:33720)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1eZhrU-0007Ls-63
	for qemu-arm@nongnu.org; Thu, 11 Jan 2018 13:46:00 -0500
Received: by mail-ot0-x243.google.com with SMTP id x15so2968042ote.0
	for <qemu-arm@nongnu.org>; Thu, 11 Jan 2018 10:46:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=R3sOfJh4T5ELFL3RDffTUMpRAsip4a95hRNK2IhP+ew=;
	b=iRXmpLPRVZ7QEWerQmDPvLEBVFzIhpKUKNErJ0dg04zMYVYQipYXgGbFqSW54dAb8E
	hagA6sUEMgwLEZWR8/YDbVvtI6pCqYf3IQqto3MnPkXv4BoBxqX0INKJpztS49OGN/q2
	+2NxbEOXyEe1GJI3wNh8thmVBMeGlVVRrxhWU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=R3sOfJh4T5ELFL3RDffTUMpRAsip4a95hRNK2IhP+ew=;
	b=HZWts/n1uzHRND/umHuN78w+oUZmCAie5Ci5Xnt3LzLfVC/EJ5CNoGdwdFmnrNTUkd
	XiLSkzCjID1mJMP2pziGxMcHpw/hWjuMLIcaQtkyBhfz2rCJT/Vhgi/9k3QHNrzOD0x4
	sA/Ykwbwuoo8sOlEilduHKeIflE/hHWHeXzblnZf/4iNnXiDNgCcapJMkCzA2jqGgGrQ
	Ma6bdXPBqTHaskoIYVzus/nUOSVceeuI0K5VyoKcqwkwEMdMIAnl7PzUwvEys9+4SBCS
	0Vofs4p0XPMs5BVj1+55KBBqnKW15et28Ql1YXQhaEGwf0fV1kWqJ4TzavIodHuilXQk
	vjug==
X-Gm-Message-State: AKwxytcNZJ8+nvflelqFE6F5rseluHXPDpEIta/3+j6WBz3/NIs/SoiM
	kvKZ5sN12Z8CAQVc4CJtgVP6EStrC3GbweV6JIOD9Z+D
X-Received: by 10.157.29.73 with SMTP id m67mr13895837otm.91.1515696359538;
	Thu, 11 Jan 2018 10:45:59 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.15.71 with HTTP; Thu, 11 Jan 2018 10:45:39 -0800 (PST)
In-Reply-To: <20171218173022.18418-2-richard.henderson@linaro.org>
References: <20171218173022.18418-1-richard.henderson@linaro.org>
	<20171218173022.18418-2-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 11 Jan 2018 18:45:39 +0000
Message-ID: <CAFEAcA96HwP9NAT_MXFwJ5LYe_D5kgoBkNyUf=JBMLSRhcAkOg@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c0f::243
Subject: Re: [Qemu-arm] [PATCH 1/9] target/arm: Mark disas_set_insn_syndrome
 inline
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 0EgbOtFe8M5f

On 18 December 2017 at 17:30, Richard Henderson
<richard.henderson@linaro.org> wrote:
> If it isn't used when translate.h is included,
> we'll get a compiler Werror.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/translate.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/target/arm/translate.h b/target/arm/translate.h
> index cd7313ace7..3f4df91e5e 100644
> --- a/target/arm/translate.h
> +++ b/target/arm/translate.h
> @@ -108,7 +108,7 @@ static inline int default_exception_el(DisasContext *s)
>              ? 3 : MAX(1, s->current_el);
>  }
>
> -static void disas_set_insn_syndrome(DisasContext *s, uint32_t syn)
> +static inline void disas_set_insn_syndrome(DisasContext *s, uint32_t syn)
>  {
>      /* We don't need to save all of the syndrome so we mask and shift
>       * out unneeded bits to help the sleb128 encoder do a better job.
> --
> 2.14.3

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
