Received: by 10.223.172.38 with SMTP id v35csp1573433wrc;
        Tue, 5 Sep 2017 08:47:44 -0700 (PDT)
X-Received: by 10.55.215.67 with SMTP id m64mr6130848qki.315.1504626464249;
        Tue, 05 Sep 2017 08:47:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1504626464; cv=none;
        d=google.com; s=arc-20160816;
        b=XbvRQKnIVvjqCldHLm534ARTVpSYRhSJniGX5kVr8DyibEmgeJNi+AOw7AvL0ZN0BM
         slV8up9KE07ka5cRh/Tu2rCGhbyX95ZREFYFztolBVQe4TueERbBxo03iW2XGwIRaxp2
         B4CCsH2k1EoK4m+9uks4ufxifWxCtxTqgwzPnSIvpFglExwhnFFe+flWBFikkDOeXbaD
         x4zk4/fqwXQRn4SwYaoMH8GivqMCZj6IVoBoXBGOrNWQzUY/CCT95WbIbskUhGOPJnwq
         vTtsYNx1oJZvkbK48iShDIbZ/taVzpwGoSK+DsjHv4UhrdzqfGUG4XXPOg9tnzEdsCb6
         1jZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=SeJer4PHerbcdb5tWhhMyl/OZx+PxnCdqH7ag24MvaM=;
        b=uYFi7iEu6+4buuDPQvzq5/bcDFSkUf/5McZSuIjsaDZSU6PoIv/z25O/V4Cn1IUhjR
         pCue6LQwI4HrcdoLHd6Bi49wvI+U6abpX05AEz7IYszgrZQ8YTlGRfGgYkYTqzt0tZwd
         i5dCkVDYFQc3dfjo2j2tP2wv2Hl0Xem4MWhtl0qFhD++5avCwBVm+jXb2YE6eAeFQlog
         yQjAfgfW6uJInksuCnhZ3so0k9RiQwWLIvbtjUzhfct5FEIaP7yf6tMsjs21rlgrYoLu
         dcSZjr4HYGjdm0xMeclv7h45MSScIxDsSPBZbgIGH/sHPF2cng2Mr/H/98zhZdUVv5/q
         Xy9Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=CxUL2Hmb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n51si574335qtf.26.2017.09.05.08.47.43
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 05 Sep 2017 08:47:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=CxUL2Hmb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:59741 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dpG4k-0006Dh-2Y
	for alex.bennee@linaro.org; Tue, 05 Sep 2017 11:47:42 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56481)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1dpG4b-0006BT-Q8
	for qemu-arm@nongnu.org; Tue, 05 Sep 2017 11:47:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1dpG4S-0006be-Jh
	for qemu-arm@nongnu.org; Tue, 05 Sep 2017 11:47:33 -0400
Received: from mail-wr0-x22c.google.com ([2a00:1450:400c:c0c::22c]:34631)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1dpG4S-0006b3-Cd
	for qemu-arm@nongnu.org; Tue, 05 Sep 2017 11:47:24 -0400
Received: by mail-wr0-x22c.google.com with SMTP id a47so7885658wra.1
	for <qemu-arm@nongnu.org>; Tue, 05 Sep 2017 08:47:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=SeJer4PHerbcdb5tWhhMyl/OZx+PxnCdqH7ag24MvaM=;
	b=CxUL2Hmbxh6CJiymF9jwVQr/jdSWeytXB20epNA41AjwD32aO/007h+E9yLsYhaSPm
	MySO0YI4Y3n50ZwVR2/l4aBJlXqI0dezRxP6kToxxfVqcwMIoXEQo5JOccm84ikEE+5r
	8uBAnRVHE/H0ogjCPgThD6zzE0GaPjkk884Zc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=SeJer4PHerbcdb5tWhhMyl/OZx+PxnCdqH7ag24MvaM=;
	b=ZR30DelFOl88kZxfGMjxJq7CcAC0NfMqY0usB7awt9U5/XIbMbHoBF6c8rg6cvwRgx
	CmHHV9JxGq7smC3yr5hflEg3b5dgyEnZ9sa7047hhmv8gtfor1dbNAhxVwbpL/Kc0QCL
	HrxAZh5o7pDNQLYPQtFYvKvgG/skXcZdXqOugQflMhS8m4hskzyFN+EpfrHSUwS6+ffe
	OLNBH3NeFIa1iqtNM6gXfhdSX2WVUq69OGgf5VIqxvDJAOaRV2IhsLrYTP0Ot1BpOWKF
	GpgK3sUigddNADGTN145RVbYnep96kb9oNxF88jzPlHSBVuLVJFpVVGUQAz/XmAdkkXu
	4NKg==
X-Gm-Message-State: AHPjjUhbubEsML9DxNKe3fldHX1AJM403XNjmBC9lu465Vhm+zqDJh1H
	TOAwKz0H3R7QGD06sEecN4n8+Wihua6M
X-Google-Smtp-Source: ADKCNb4gyGPHzC6r/Xupsho1lPmpPFOKWnycztagywggEhIDH2tbMtWBpjdK58YWtIzD7rplMfjsozsgnQfiSh+xmck=
X-Received: by 10.223.130.21 with SMTP id 21mr2576633wrb.196.1504626443315;
	Tue, 05 Sep 2017 08:47:23 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.159.68 with HTTP; Tue, 5 Sep 2017 08:47:02 -0700 (PDT)
In-Reply-To: <20170905131149.10669-1-famz@redhat.com>
References: <20170905131149.10669-1-famz@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 5 Sep 2017 16:47:02 +0100
Message-ID: <CAFEAcA8ULL2=DjcuT5BRipKGm6t95VD-oT6Uh8eYAcTKGKySeQ@mail.gmail.com>
To: Fam Zheng <famz@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c0c::22c
Subject: Re: [Qemu-arm] [PATCH v6 0/6] arm: Make use of DEFINE_PROP_LINK
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: E/LHn7PqHFfV

On 5 September 2017 at 14:11, Fam Zheng <famz@redhat.com> wrote:
> v6: Rebase and resend v5: Add Philippe's rev-bys and fix one typo in bitband
>     patch.
>
> This is the arm part that was left out from:
>
> https://lists.gnu.org/archive/html/qemu-devel/2017-07/msg04006.html
>
> Make use of the new DEFINE_PROP_LINK, in favor of open coded the
> object_property_add_link. The advantage of it is the property now get reflected
> in the info qtree output, for a bit more introspectability.
>

Applied to target-arm.next, thanks.

-- PMM
