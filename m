Received: by 2002:a19:cb43:0:0:0:0:0 with SMTP id b64csp4616360lfg;
        Thu, 27 Feb 2020 07:52:40 -0800 (PST)
X-Google-Smtp-Source: APXvYqz5kyjUKM1A/+gj3xckFBX2raw0Y7jbm1ds1ksNWhHwDi2qk1C30JCb/WaaLN1zAr+QMAuM
X-Received: by 2002:a17:906:3746:: with SMTP id e6mr4791286ejc.165.1582818760455;
        Thu, 27 Feb 2020 07:52:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1582818760; cv=none;
        d=google.com; s=arc-20160816;
        b=rIpuMx0G3niAgM+57s9xfqZhtrF1QXyDafCEz1fNdadh9SPmEDAv3AsnlpTH1//bvx
         mwoqaDYFAKlPR9UQqpTNjiDwU4UGFbHDkgdCjBUjA9Do6rSIp4xsDSECcWXXqfw2MvOq
         QZdnJ4LMGmtHmYTBVpoRtyFEmnVIkk/i5MmgL7h7g8Dd3ryihgdP8NOKGZlMOJgKIK67
         XkwrLgYtUCe2HiPJ0xGIDa0ilsIthjSUmPFjzN0k2NPnp5zYNkQjll5P/Ai9RNVBrPMF
         yUfAxg8Ypj6CJIluAWI5NssS2418TRxLWvpt/g639+kHNPCngGlTNs6VOmRycVg8Pz4H
         UA3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition
         :content-transfer-encoding:in-reply-to:mime-version:references
         :message-id:subject:to:from:date:dkim-signature;
        bh=5KwB+4nPPWFT9Zo+52l+UcQYm3R48JujDx1PXyBuh3I=;
        b=AANxm7VS1N4VGwiqXctxxrRRHLpqrygRDQ2JygsaO420z5DRE3g3Q0cmU3u9R3sW9c
         Ax1vz75FWDqQPH7O1Nbroj6GhiAiVvOdQNQrHZfPauiGnOljN/Y6femy0aj6aaVvAiLr
         i/hDhYq7LjqGVO0RvjIutNhvEEzoT3sss7fC3bCyuJImu6OENRoeQL34BpCKkxbtrZsQ
         327pQXWVMswyq3DNRL8E4j42KiG5C7bU1jpAf35fY4tFjyafHZ/qxhgUYCqTCI1UD6p6
         /SPoGNzPWUsF/ReeSkX36d3zNPX+twmJadtqh6ddsOkG2XQuiF30aWkQ0afMz9O9X1tS
         aDoQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=dqBBmDre;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j24si2082276edp.230.2020.02.27.07.52.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 27 Feb 2020 07:52:40 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=dqBBmDre;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:33642 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j7LSp-0008SC-DD
	for alex.bennee@linaro.org; Thu, 27 Feb 2020 10:52:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34222)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peterx@redhat.com>) id 1j7LSh-0008Pz-8C
 for qemu-arm@nongnu.org; Thu, 27 Feb 2020 10:52:32 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peterx@redhat.com>) id 1j7LSg-0004jv-DW
 for qemu-arm@nongnu.org; Thu, 27 Feb 2020 10:52:31 -0500
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:38819
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <peterx@redhat.com>) id 1j7LSg-0004j0-9c
 for qemu-arm@nongnu.org; Thu, 27 Feb 2020 10:52:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582818749;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5KwB+4nPPWFT9Zo+52l+UcQYm3R48JujDx1PXyBuh3I=;
 b=dqBBmDrefQycFPfdmp9z3iHMlcT6QrQavtWQSEJ2rrBewT9vZ2mZ4J7XVn0k0PV/fZz8ES
 hCsz1jZhu1QdOoBjvJ/qSY2uLpVJW7UhBrIB/hsyljx549QuUL001R3pN9katZ5o35a8KZ
 Iv/JWcdPrwzQurTls5q2Uj4k4VbwQL8=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-166-h3GUMbb0MxemeGvGS8vwKg-1; Thu, 27 Feb 2020 10:52:28 -0500
X-MC-Unique: h3GUMbb0MxemeGvGS8vwKg-1
Received: by mail-qv1-f71.google.com with SMTP id s5so4146339qvr.15
 for <qemu-arm@nongnu.org>; Thu, 27 Feb 2020 07:52:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=HbpZ79Vvpf6y5qlqo/6aoznhZgU8GmfHB3anv411c9o=;
 b=PWg6dcfkOG0lCnpeT1rVImVsBj96c/rQav1ocqJk02g5MQjfvBoJdFRFBczPyuSUl/
 zkVg/v/IvdC5z5fM6/nU2EAwDVgQMiIH+A9gxtX5+WlQR9E5I6LwvXb6W9UPryL4c6ig
 pUeIUUNYuVSDfhLZnmgShvGeb/zpOaLAp5KHFWhiE2l57uTTRFOZHoZnVOnn/Q/+VF1M
 MlUDnOtOv6zlxi0CRNQRImeM2kUBs6X9UyrjxhHeoA0MsRCuljayiqr2+2PFGuaymBnx
 098I/EpujVjGPQY4tsBEgOvCchJBgetuKMVi1Y7/Hi6c5kY5Q9tS0NVlph7Ix5qCml2b
 w3ZQ==
X-Gm-Message-State: APjAAAWBoyWB4OcKBGhyEv15vefUGtODQFDdpoClkcCN37kEgddu9ecg
 rCXyoHsZ7DBfKovoFaxf5eHLwFfc23UrjySyF4V1LCIpqe5X6g9izlpsb82kOsqXmDQg3ta+/9+
 hUBiaqZTSSCn1
X-Received: by 2002:ac8:5510:: with SMTP id j16mr5789093qtq.262.1582818747680; 
 Thu, 27 Feb 2020 07:52:27 -0800 (PST)
X-Received: by 2002:ac8:5510:: with SMTP id j16mr5789067qtq.262.1582818747455; 
 Thu, 27 Feb 2020 07:52:27 -0800 (PST)
Received: from xz-x1 ([2607:9880:19c0:32::2])
 by smtp.gmail.com with ESMTPSA id i91sm3362620qtd.70.2020.02.27.07.52.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Feb 2020 07:52:26 -0800 (PST)
Date: Thu, 27 Feb 2020 10:52:25 -0500
From: Peter Xu <peterx@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH v2 2/2] hw/arm/smmu-common: Simplify
 smmu_find_smmu_pcibus() logic
Message-ID: <20200227155225.GE180973@xz-x1>
References: <20200227075111.15275-1-philmd@redhat.com>
 <20200227075111.15275-3-philmd@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200227075111.15275-3-philmd@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.61
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Eric Auger <eric.auger@redhat.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: e8J+EPfDVL3z

On Thu, Feb 27, 2020 at 08:51:11AM +0100, Philippe Mathieu-Daud=C3=A9 wrote=
:
> The smmu_find_smmu_pcibus() function was introduced (in commit
> cac994ef43b) in a code format that could return an incorrect
> pointer, which was then fixed by the previous commit.
> We could have avoid this by writing the if() statement differently.
> Do it now, in case this function is re-used. The code is easier to
> review (harder to miss bugs).
>=20
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

Reviewed-by: Peter Xu <peterx@redhat.com>

--=20
Peter Xu

