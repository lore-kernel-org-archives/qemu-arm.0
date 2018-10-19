Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp3640919wrt;
        Fri, 19 Oct 2018 04:00:11 -0700 (PDT)
X-Google-Smtp-Source: ACcGV63IpLMnzyFtjIqPRf4Vmyy3mvLmuz/uZ9aYjcfsZUkTCvCsVLV8xITVQ1xLNY1Cy83TS/gP
X-Received: by 2002:ac8:e88:: with SMTP id v8-v6mr11381189qti.140.1539946811718;
        Fri, 19 Oct 2018 04:00:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1539946811; cv=none;
        d=google.com; s=arc-20160816;
        b=pseUKa8ja/KaZ3gdfEVb5D++GoAyHf37DFXj2p/FBsIJLBWvIbT/g/NEIxZ97MskCM
         HPP9zlBm1nDwDc7WmSPODlkoM+7TCnnn+P9aGWHx1pFmFRLS0ionNks7JhGTnA5DOCzI
         MX1BdyBUiI2CgoaPCNx1hYHUFFSmd2XNUOkoIfIM532xnSo+XYBvPCVpiszknNYlsgNf
         Dv61gBJQcjHex0wCZP7+Ylk2OkI5sdna5Ad4/UHjYw9PirGH0oi8AQ/xwID1N6S6NjsN
         RuYaB5xN2Xvci+HwdorFxdjjd8Toixd7wrHVkH7yQYzoY4oWoMTLMh6VANyo4q+yVOki
         KmSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature;
        bh=2IKBjxMc9VfsZHo2A6AdOOKGNERd1TaTup/rDsSUqyk=;
        b=sqD+uXGVGbJhzIT8v650p1HS7F8PVou7nL0fuUoVnbBSPh5nTEzM+LaTIh/04l/q6G
         r8q57qNlcDRyw/tmMqftBmQ08oZpuT3Qk746NrOtg/e8V9GeJwrARcLloai4xbVIhleW
         EWWx9ILX6SMzfZ+jWcyXgfYRreozZXODD/t9daC/ky11HxU/tSkhRl3hwgjoYMC3cD2r
         K6/N6Ydy/3Hm+gKFDgLoV+F5aV/t9lL3YCT5mOEDB5mmdRDXHg0r1CrF3aynE5A1TV95
         qrhReKbgyutadHe+axaM02PLBGv16b19nwqjmCjPPt4Al3U9T8TV1ZCboqrdtQ2U5F8d
         XY/g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=khuFJ0YO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d6-v6si3805333qvb.143.2018.10.19.04.00.11
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 19 Oct 2018 04:00:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=khuFJ0YO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:48585 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gDSVn-0002Km-3j
	for alex.bennee@linaro.org; Fri, 19 Oct 2018 07:00:11 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60064)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gDSVc-0002JM-DP
	for qemu-arm@nongnu.org; Fri, 19 Oct 2018 07:00:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gDSVZ-0004WA-Vq
	for qemu-arm@nongnu.org; Fri, 19 Oct 2018 06:59:59 -0400
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344]:44191)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1gDSVZ-0004QC-GX
	for qemu-arm@nongnu.org; Fri, 19 Oct 2018 06:59:57 -0400
Received: by mail-ot1-x344.google.com with SMTP id p23so32748185otf.11
	for <qemu-arm@nongnu.org>; Fri, 19 Oct 2018 03:59:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=2IKBjxMc9VfsZHo2A6AdOOKGNERd1TaTup/rDsSUqyk=;
	b=khuFJ0YOszy7idsTbhObBRq3BsKMiP5zwcIa7hE8xUMrekx5T0NHhBLsEmBgwM6+WG
	zfRfUpnw2PtIyNY4t/L5LmuZ/4O9b6V5MrdkWdODjDyf3F7+DkUy1cOX02N8R+JlZH10
	4XrrrbvYACuiynhF9CFirvAA+TraYol8LhnNE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=2IKBjxMc9VfsZHo2A6AdOOKGNERd1TaTup/rDsSUqyk=;
	b=he137YkUsKRN629Yvpmm3apDzkuXHJiy5pZbqhAzJaLJwXFjfVnUFBaJN1HIGdx0jP
	5qwdKmYUtwiR/OmGP4Oy5bEzDnaKPBHYQmyEEJfmetjDVuwitUIRvsG+LlhzxlosrcTj
	2rVViQnLyr+cuFoV/17QSoI+okGOvycuM5MtaqZlp+irEcyuy9GJaseGodJfl7rMhHCl
	cXfNIM3TkVHZQaOAyvCpnOX2eFAKt3eGikbsBjQ1+31waDkCIaxiCJGGDsXNnzbiKCxw
	D1EJSl/1mazxrJldYdkPGxP+RTAdpIN12S5zWOUhX1Dzw7jg0Af0wOUUNNAogar4COLE
	gUIw==
X-Gm-Message-State: ABuFfohh0z9YtrAyKn8jVhF0o1JYXqvR04Xb8W1DuE/cTSlgIJ7nJdce
	Dlhqs0sDIsKGyt4V6jMRthu6NLG6/pmnNM+hDSh+vQ==
X-Received: by 2002:a9d:1ea3:: with SMTP id n32mr20815522otn.352.1539946793934;
	Fri, 19 Oct 2018 03:59:53 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:7c90:0:0:0:0:0 with HTTP; Fri, 19 Oct 2018 03:59:33
	-0700 (PDT)
In-Reply-To: <b8a89518794b4436af0c151ed10de4fa@dornerworks.com>
References: <b8a89518794b4436af0c151ed10de4fa@dornerworks.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 19 Oct 2018 11:59:33 +0100
Message-ID: <CAFEAcA8FU97+DZH127zNgUwzornSCg2qMX=FDfXV1B40yqgGPA@mail.gmail.com>
To: Stewart Hildebrand <Stewart.Hildebrand@dornerworks.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::344
Subject: Re: [Qemu-arm] [PATCH v2] hw/arm/boot: Increase compliance with
 kernel arm64 boot protocol
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
Cc: Andre Przywara <andre.przywara@arm.com>,
	Julien Grall <julien.grall@arm.com>,
	"qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Na5EBISvcoMv

On 16 October 2018 at 16:06, Stewart Hildebrand
<Stewart.Hildebrand@dornerworks.com> wrote:
> "The Image must be placed text_offset bytes from a 2MB aligned base
> address anywhere in usable system RAM and called there."
>
> For the virt board, we write our startup bootloader at the very
> bottom of RAM, so that bit can't be used for the image. To avoid
> overlap in case the image requests to be loaded at an offset
> smaller than our bootloader, we increment the load offset to the
> next 2MB.
>
> This fixes a boot failure for Xen AArch64.
>
> Signed-off-by: Stewart Hildebrand <stewart.hildebrand@dornerworks.com>
> ---


Applied to target-arm.next, thanks. I rephrased the comment a bit,
since this isn't a virt-board specific issue.

-- PMM
