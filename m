Received: by 2002:ac2:4942:0:0:0:0:0 with SMTP id o2csp1750771lfi;
        Wed, 4 Mar 2020 07:38:52 -0800 (PST)
X-Google-Smtp-Source: ADFU+vtg3UQlMZv55irfEdKnyWNBrl4ye85G6TGdgOG2aOZq2qJqEjcz2J1oHMqJ4LdqJtLQisiQ
X-Received: by 2002:aed:2169:: with SMTP id 96mr2975216qtc.124.1583336332426;
        Wed, 04 Mar 2020 07:38:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1583336332; cv=none;
        d=google.com; s=arc-20160816;
        b=rcFGmCvpWLcKNyYjAcfeSzbVZQZ8HQy/P+N7wRjuyWE4g7/Idm6O71FbIhIGY5b0US
         29pOmjOBmsLDhrhrvZE8GPc6Dcdg1P20vao91BonCnR5vNnMGOeh6o9JFV+5nenEaqYz
         rmZNkMMyYgkWu4WIluCAfONJwH8eHFYmiVxmYWy6LlQOYGaWTMiEGTV0dMdyhQEcKKvk
         NRcgd38g9InYsSJw2I1j8978P7UtdSPUmGjIytDJJOwq13eQrSxWEm4CW+Gr938zyZ/X
         b4FlbO5ggeYzUweDpAW+u0KAjapvVGQF/ARaN8KjRFVhUTjxJLY9PXJHIt5W7CZgowHc
         VXbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=LLwegWhksnCSFhbTsg9HBFdexec8o5i8mlRI0ZESlcU=;
        b=afF4OqAuKmZhXIWE2YyWwcC0Xo0xVKSzfALC7TUP2BP2GMyG7ox7OTYmPyNqw3JmXB
         zi5mqBu5UJmOL9v/3cP4lxcgRg4lNjVLtq13z/Re0fGEbEFepP/loNmm9H5vWI2WlVO8
         RIBRc9ed46UPDZoHvWQRMw8PnziXXC+h3MZ/931IwUMG+m5QTaTcsPFsJIT0DGI/0+Bo
         N6agVFtmWhsvx1tEq66/1rdbn/GS1dvUmCvsivxgUQQIb6S514BB/70cAtoUlVVOgt88
         reQCeL//LCO+mFL7Kw9DC1ZSWIXYPVvZW0de2IL8B77wWdEFDOVfd8ELjKQ/fQrFWzXf
         cBxg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=QpTAM0lt;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id cb6si449568qvb.101.2020.03.04.07.38.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 04 Mar 2020 07:38:52 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=QpTAM0lt;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:35824 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j9W6l-0008Vr-MU
	for alex.bennee@linaro.org; Wed, 04 Mar 2020 10:38:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46376)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1j9W5Y-0006gn-OE
 for qemu-devel@nongnu.org; Wed, 04 Mar 2020 10:37:37 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1j9W5X-0008MN-Pm
 for qemu-devel@nongnu.org; Wed, 04 Mar 2020 10:37:36 -0500
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:43213
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1j9W5X-0008MA-MI
 for qemu-devel@nongnu.org; Wed, 04 Mar 2020 10:37:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1583336255;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LLwegWhksnCSFhbTsg9HBFdexec8o5i8mlRI0ZESlcU=;
 b=QpTAM0ltttNKKHSn39x7xHRioK+Tpr9UDiOPFsCTdNcPqzszh//oKVpAeX7BD1i0QCbIAm
 Pt8d4LZdDFPtLoMdqA4ycbvZEPKglSHK6bZq/NUm0BxsXVTlrRac+xbQAztPGT5UW4+FW5
 W4hds4xYTvmMezPRcx+c0On0YeJ2fpg=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-290-qyEA4FlCOBml2P9BAOiczQ-1; Wed, 04 Mar 2020 10:37:34 -0500
X-MC-Unique: qyEA4FlCOBml2P9BAOiczQ-1
Received: by mail-ed1-f70.google.com with SMTP id r26so1910669edl.5
 for <qemu-devel@nongnu.org>; Wed, 04 Mar 2020 07:37:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=IaZb3jZXgXUQ0Ui30FG9rDWKE080uydwkImMg1ijy3A=;
 b=TSezTM5/yNsWFX3m7NIpYk5Yb0UffuAnBryvDeftpZw0i0fCCi7B5mypZEupFmudmF
 UrXYhYvfmlXwsF2JvrG2BIqWucm3DgeJrucmnsGTc78Rf59vm9I92P+KJZqKUthAxW/s
 vVGqr/epbJeq8PWUdogVPt9wV3mimE2RacTolMERhDTea0DGcnA56Jw2ClY2QP536z9V
 bDTQjsNPPHqtCiwyF2jPwNXaW9zsEUan8SDr9lWd+jUtX/yq9X3ceMkGIiH5aMxEQiYU
 t4MQlkZVPGmhLsaPvobzX38ERMo8hnud/61Tbs0kF3Ijo9R1PX1ntyhkzaMj6GsVpPck
 FY4A==
X-Gm-Message-State: ANhLgQ2XhSmK4SQdbrdXqtFvQ9ZjxZERsYUmz7/MQxn3cwfPHco8RNUp
 IB1Xh6FoOSLtESJXL9yOKS2m3hcRG7B+Br2t1q3wDPmytOMAlNabx6yxd5JIeMQDIKk3dh86UqO
 zt/eZS3J0E9duKi8=
X-Received: by 2002:a05:6402:6d2:: with SMTP id
 n18mr3445023edy.32.1583336243715; 
 Wed, 04 Mar 2020 07:37:23 -0800 (PST)
X-Received: by 2002:a05:6402:6d2:: with SMTP id
 n18mr3444980edy.32.1583336243519; 
 Wed, 04 Mar 2020 07:37:23 -0800 (PST)
Received: from [192.168.1.35] (47.red-88-21-205.staticip.rima-tde.net.
 [88.21.205.47])
 by smtp.gmail.com with ESMTPSA id d2sm97623edz.1.2020.03.04.07.37.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Mar 2020 07:37:23 -0800 (PST)
Subject: Re: [PATCH 0/2] misc: Replace zero-length arrays with flexible array
 member
To: qemu-devel@nongnu.org
References: <20200304153601.23423-1-philmd@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <307b81ff-a56a-5f43-20d4-edb75776390a@redhat.com>
Date: Wed, 4 Mar 2020 16:37:20 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200304153601.23423-1-philmd@redhat.com>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.61
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
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 David Hildenbrand <david@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Yuval Shaia <yuval.shaia.ml@gmail.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>, qemu-block@nongnu.org,
 Paul Durrant <paul@xen.org>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 "Gonglei \(Arei\)" <arei.gonglei@huawei.com>,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Eric Auger <eric.auger@redhat.com>, qemu-s390x@nongnu.org, qemu-arm@nongnu.org,
 Igor Mammedov <imammedo@redhat.com>, John Snow <jsnow@redhat.com>,
 Richard Henderson <rth@twiddle.net>, Kevin Wolf <kwolf@redhat.com>,
 Xiao Guangrong <xiaoguangrong.eric@gmail.com>,
 Cornelia Huck <cohuck@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
 Max Reitz <mreitz@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: jmpZ33zRaWKg

On 3/4/20 4:35 PM, Philippe Mathieu-Daud=C3=A9 wrote:
> v2:
> - do not modify qed.h (structure with single member)
> - based on hw/scsi/spapr_vscsi fix series
>=20
> This is a tree-wide cleanup inspired by a Linux kernel commit
> (from Gustavo A. R. Silva).

Please ignore, for some reason the 'v2' tag is missing.

