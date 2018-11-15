Received: by 2002:a5d:6844:0:0:0:0:0 with SMTP id o4-v6csp7213916wrw;
        Thu, 15 Nov 2018 08:28:39 -0800 (PST)
X-Google-Smtp-Source: AJdET5esRL1C7zBjrRDU9EgnCT5pZUrev8rocucvBAkbmTH9IgQRXXJCRFVNHY8OQNEc7gP2JrQt
X-Received: by 2002:ad4:5282:: with SMTP id v2mr6795218qvr.195.1542299319552;
        Thu, 15 Nov 2018 08:28:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1542299319; cv=none;
        d=google.com; s=arc-20160816;
        b=OUefyXAKI3WVCnpT0koe4iFtvBqUkGaXXrbTgRg+4F1GAv40rt+ia2wxzpD4DSsWY9
         pxUBpZ9uEs7KIcGWlB01IvrEh3eFVqpjPcS56Rx7X4W6mFQ2ukNBGRzEsAnIJdo3uh9g
         lYPpAoAEfDRYouqu0KoSl51wJEQnlkaXQWMYGrHBb+nH6Zz9Uc865I99ArVMSVOgFzsa
         ak/NEOg+RbWl4PgpPZKBxS+lW7wQJmMK+whmUxUTcneC04X2uCE8PoqDS7lUjpw8MZsU
         bCoak+3v7v5ij/LReMYi82POTlFdjQQhgSJ6HzR+GkArkmNZKpWJrhMaeIz69wfTDcVM
         sNBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature;
        bh=rXwACu0Ua8GxlY268yZ3qjEVTdTbF5Ew+yDVbwlV8Ak=;
        b=lppXR3/SF365MIcLZkur8SCqJSFEgSTEegyr9Dz8Hpb+Q+3gPkMbzpp+Wt+BMT/pa7
         Yn92Uefpct6rg7jClf7nOun2USotp2hCi+DLzCjwYQajLCj6/uzkKsjSD0CerczOcKVO
         2EfUS3FWr9SOw0r+DBpZ7CKVSxzq8Ral6SFKDdlo+MwFQR/5H6qI/DgLOFK7q4Ebrf8R
         FrwHjPsP9Rf8C9uksetIMh4MXJy3+gdbtDhruJ3v1qMELvjtbHDhzQWxtJoBAfET9ILQ
         RPtpAyVn4nsEK1dpCCIia7XNDiLpIrwiNfK2bN96In66gAlUjMZCKkEJzS/XJJOeNk8h
         gmCg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="ZB/WbQXw";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f97si1881969qtb.199.2018.11.15.08.28.39
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 15 Nov 2018 08:28:39 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="ZB/WbQXw";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:39711 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gNKVS-0007QD-UJ
	for alex.bennee@linaro.org; Thu, 15 Nov 2018 11:28:38 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37968)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gNKVH-0007P3-Gv
	for qemu-arm@nongnu.org; Thu, 15 Nov 2018 11:28:28 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gNKVC-00066a-6b
	for qemu-arm@nongnu.org; Thu, 15 Nov 2018 11:28:27 -0500
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343]:34926)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1gNKVB-00065k-Vu
	for qemu-arm@nongnu.org; Thu, 15 Nov 2018 11:28:22 -0500
Received: by mail-wm1-x343.google.com with SMTP id t15-v6so18642196wmt.0
	for <qemu-arm@nongnu.org>; Thu, 15 Nov 2018 08:28:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=rXwACu0Ua8GxlY268yZ3qjEVTdTbF5Ew+yDVbwlV8Ak=;
	b=ZB/WbQXwyxnMaRVnpW9g6wJYA3bGR8sz9YO6RkaITvJxgvvSf0lPT7I28froRTGj2m
	jprRftCFrTrVsrSRnPESEj5uACEWXMKBB9uzyQ7afM5vJlbuyNdejd+fKSGKUw4zJ1j7
	Boon0xBS14NVJQnezSFghjNuCi6THcQTpFV10=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=rXwACu0Ua8GxlY268yZ3qjEVTdTbF5Ew+yDVbwlV8Ak=;
	b=hbPQ/2QpW+ImQ9TQMXg1chmPM8s41jXm3H7XyogyH06JlDdLyOPTyWQzvRBunk/Zoz
	qc7fOIoczztECGKHZ9JFS5+NA1gw9N6EuU1dgUiW8fLYMQpzRqyXdiZVc8IxPQoostRc
	HTqPNta1sYebPcEHrBTibtC0U7MHV3NR8dqKJ4wiGtyMn0MMQA7VgRDAcPR8a4awKYE6
	tIODkKIMatp4ni7bWzLDbBqnVzL3viGBdYoKMnW7/BSiDHdOJ8mIBw4agyz1dbKjOIB8
	n/z32anZoH4Qt9WH6Sg2NimWWTwU3c6QXkeCnhSDpRGiGkLJNPEhGHzMJLJzJwWP75/R
	7sHQ==
X-Gm-Message-State: AGRZ1gLJTRspkgoVc2rM+0DoRIPytlA184NO9J4kSp4/vv/U21+CjgMP
	Xh+I1opXg6yU7QHJdntT2tt3xg==
X-Received: by 2002:a1c:98d5:: with SMTP id
	a204-v6mr5721111wme.73.1542299300563; 
	Thu, 15 Nov 2018 08:28:20 -0800 (PST)
Received: from cloudburst.twiddle.net
	(57.red-213-99-142.dynamicip.rima-tde.net. [213.99.142.57])
	by smtp.gmail.com with ESMTPSA id 3sm25501122wmk.12.2018.11.15.08.28.19
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 15 Nov 2018 08:28:20 -0800 (PST)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <20181115143535.5885-1-peter.maydell@linaro.org>
	<20181115143535.5885-3-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <9a177b12-9618-a108-08bb-b78e71bc7b3d@linaro.org>
Date: Thu, 15 Nov 2018 17:28:17 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.3.0
MIME-Version: 1.0
In-Reply-To: <20181115143535.5885-3-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::343
Subject: Re: [Qemu-arm] [PATCH for-3.1 2/2] hw/block/onenand: use
 qemu_log_mask() for reporting
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
Cc: Thomas Huth <thuth@redhat.com>, patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: X0d4kW8mmgZM

On 11/15/18 3:35 PM, Peter Maydell wrote:
> Update the onenand device to use qemu_log_mask() for reporting
> guest errors and unimplemented features, rather than plain
> fprintf() and hw_error().
> 
> (We leave the hw_error() in onenand_reset(), as that is
> triggered by a failure to read the underlying block device
> for the bootRAM, not by guest action.)
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  hw/block/onenand.c | 22 +++++++++++++---------
>  1 file changed, 13 insertions(+), 9 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

