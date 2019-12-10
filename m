Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp6069700lff;
        Tue, 10 Dec 2019 08:50:49 -0800 (PST)
X-Google-Smtp-Source: APXvYqwALg+zqU7D52Xb4exbP8uKUZeY0lkSYXJa2Y8f6mQzMRSGuy7iXFm1Jckfoj97zxPDor/6
X-Received: by 2002:ac8:4117:: with SMTP id q23mr31317531qtl.66.1575996649696;
        Tue, 10 Dec 2019 08:50:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1575996649; cv=none;
        d=google.com; s=arc-20160816;
        b=U8b97tBISjd9dU531Xe6Uv5EcerK5fyph6EMWeccX7OTXvZ0TWxY0urC2iQ/GL4r39
         taELPO7NLMGvcX943Vp/NrIryaiQaxiWZ8i2k+yf7Tlnzog+XR2d3KKZRO2+CoAYE7jh
         Z0r+KnV4Lf26ROhDBIlriBasXuAWG1UqviWTX6Y4O9kXeySI0fN1lY/Z14D2O4bWSrMY
         jevL7SHcBLkrKzu/NP1nAEOuQbUowZUGEjs0M7VuJmdQQ2QLEU/QE+bu4WWHqbT7yNlo
         qP1S9uRFjvVH/G1FNxmOOge+mPVIn5tckyyI7tcIyRtx3lP+u5TEuJKjNdI4EFE6m1jJ
         oSmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to:content-disposition
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=MaG2yhQk2cqVE1psdudnea3pLB+w1y+rXcyshwhvQEQ=;
        b=AtaLKdbUpilnyP6TliHvD3LkbTwJItmwFeLIEYXPQPMaQFlBG7RIbJKoV4WPbYyjWh
         mtHXc6ygghW8iIR7B7Bi4lNbfqPs0OHjwjYWdxjp6k6OLM+Sy+YfbBYzxC/FyV5f89mZ
         DCf5JfPXxle7uA0Oqhg+6VfiSm6BeIbUIWOnLGHkYcpcTSFvU3KoZX+9zMpk/EzUFWlp
         tJP8nr1YIK8Wzf7ws/wtm/fW1odpGpYacLL5ChONjzuMqgDrxftppAvRIEAqqyWDYKnP
         /b/qJ7Au5+lDs3p+3NrNyIjnpSEH23IT3G1HXTYxe2fBRMIRADTsqNrBRqwX4l/gO3e3
         2y1g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=C37tM1vu;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q33si2145773qtj.126.2019.12.10.08.50.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 10 Dec 2019 08:50:49 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=C37tM1vu;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:59258 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ieiim-0007eP-5d
	for alex.bennee@linaro.org; Tue, 10 Dec 2019 11:50:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59514)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <jean-philippe@linaro.org>) id 1ieifH-0005be-AO
 for qemu-devel@nongnu.org; Tue, 10 Dec 2019 11:47:12 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <jean-philippe@linaro.org>) id 1ieifG-0005KJ-1j
 for qemu-devel@nongnu.org; Tue, 10 Dec 2019 11:47:11 -0500
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441]:40760)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <jean-philippe@linaro.org>)
 id 1ieifF-0005Jp-S9
 for qemu-devel@nongnu.org; Tue, 10 Dec 2019 11:47:09 -0500
Received: by mail-wr1-x441.google.com with SMTP id c14so20877808wrn.7
 for <qemu-devel@nongnu.org>; Tue, 10 Dec 2019 08:47:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=MaG2yhQk2cqVE1psdudnea3pLB+w1y+rXcyshwhvQEQ=;
 b=C37tM1vu50Xd4/4ybdT4NjFOcRVsfZpTVIze9zGBYP41ep0mVm45g8YQEQLTDqxJBY
 JIhL7ZGtRi8k7sO7n4rFRD2061F9nPLQ0ZxyuD7K4OPOWkGXt9dkl/De+mfDT56CE9PH
 Vbw2dbsVLSGzcEBApcxllDjzVxOL2STEVmOkCWzl8Svbia3N9iiHPjojElzZHX/aFrXp
 caJPrw2+ReyMjwz8QFHMLre3WY7fhdW+UDe+x04Lv/n49pRrabnwnBPwFUzC8Ae/u0bb
 mBha/aiRRvxcvcSizi4occldr3egmOeszng7i71VqLWdvZPfnFxI53AgWlORyNNYvfkJ
 9zSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=MaG2yhQk2cqVE1psdudnea3pLB+w1y+rXcyshwhvQEQ=;
 b=M828gUo0Ge+6Go5Wux0SyrpTRuRtl8StSunT9LmewJEcho2HGg1nPNHCokmNtl+pl4
 Wh6U8JY8U9VZFKqaEuunEHbCXFbd0AiEpW207tzgAEZS+YjfWWH2YH+AuZHmlc5vUZyz
 NAy7P+zt32+QHeHV5UzJIth/qimC+os6M8492zH8BBJSusdNgI5Ws52zEJNArtMCRa0h
 vT5AQARc7LCdmtj7I8vRvEcJUR5nQO6ez+n5/KUZgKIqCUjXUZLEJyeY9TfyoyiqQ2a4
 mqQkpnEmdtg6qY6ZRA1wDp1x0TBeNnDr7Avx5DbUTECQTqXa2PrMWh92HjYRjUZC4IXz
 s1JQ==
X-Gm-Message-State: APjAAAVOEAhRwXYMYU7mZz9/HGMq5maA+/tx61s+o2VRL82qvQ4WhQL9
 zbxx5Iz9GmjEvV2Dov9/PthiiA==
X-Received: by 2002:a5d:43c7:: with SMTP id v7mr4121910wrr.32.1575996428921;
 Tue, 10 Dec 2019 08:47:08 -0800 (PST)
Received: from myrica (adsl-84-227-176-239.adslplus.ch. [84.227.176.239])
 by smtp.gmail.com with ESMTPSA id f17sm2032251wmc.8.2019.12.10.08.47.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Dec 2019 08:47:08 -0800 (PST)
Date: Tue, 10 Dec 2019 17:47:04 +0100
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: Eric Auger <eric.auger@redhat.com>
Subject: Re: [PATCH for-5.0 v11 15/20] virtio-iommu-pci: Add array of
 Interval properties
Message-ID: <20191210164704.GM277340@myrica>
References: <20191122182943.4656-1-eric.auger@redhat.com>
 <20191122182943.4656-16-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191122182943.4656-16-eric.auger@redhat.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::441
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: yang.zhong@intel.com, peter.maydell@linaro.org, kevin.tian@intel.com,
 tnowicki@marvell.com, mst@redhat.com, jean-philippe.brucker@arm.com,
 quintela@redhat.com, qemu-devel@nongnu.org, peterx@redhat.com,
 armbru@redhat.com, bharatb.linux@gmail.com, qemu-arm@nongnu.org,
 dgilbert@redhat.com, eric.auger.pro@gmail.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: bKz1zBKCRu0m

On Fri, Nov 22, 2019 at 07:29:38PM +0100, Eric Auger wrote:
> The machine may need to pass reserved regions to the
> virtio-iommu-pci device (such as the MSI window on x86).
> So let's add an array of Interval properties.
> 
> Signed-off-by: Eric Auger <eric.auger@redhat.com>

Reviewed-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
