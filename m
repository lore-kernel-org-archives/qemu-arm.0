Received: by 2002:a17:907:d504:b0:9b2:89ee:1eb8 with SMTP id wb4csp297194ejc;
        Mon, 25 Sep 2023 04:05:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEDiHSYbWcFABbEdZCpqKng+Sb8CJ9YYUAaT7aSbzGArSZmZM1AOaNlOiQytnTqLSsmSJsg
X-Received: by 2002:a0c:f105:0:b0:658:41ee:faf2 with SMTP id i5-20020a0cf105000000b0065841eefaf2mr5549223qvl.23.1695639950514;
        Mon, 25 Sep 2023 04:05:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1695639950; cv=none;
        d=google.com; s=arc-20160816;
        b=oI5Kw7l2EDi0iw+jCuTvt6USjwqcVXDw096RvdD/61dBB8eVKdD/OALOD42mlV6LAX
         YzDnNNFDAg4vfkhShf6k3FezKSgAl/NUy65DKx77DcqUB9L33Cq8nCpvTYqwrcfGcIYw
         5zFNrKEXW0zU8Fs1VVNSSnlMJUSOKvCvZCyPO0E5UqzjkhcbdjAiOkCA4YZiT+O0ipYn
         JJsYg15AZtAIFI3p8EQSPEBNHhBcyUvjJoOgVdr59Ck+kuSVpS3scp4rD0yL5t2n1Vxx
         Mj+p+iJeFJrW5weB7HiAGmUQ6nQ2pgPQeiS2wIYMVu+Mvf6ywegfzZg1PK18M1fZjtuF
         8ttA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:user-agent:message-id:in-reply-to:date:references
         :subject:cc:to:from:dkim-signature;
        bh=tSiXhg7O6fxSFsDaE+jTLIFbtfmyKZG1tiIh/KHykFc=;
        fh=AH7BRwb9ILkE1lrhGqqy4gY6T9cx/fm1lA54JJ23CXE=;
        b=Y4hbQ89ENZmVR36n5ewB97BVZclUrSsLTPrDy2kUCgshcSpln6SXJoDmdJHVvb0YuZ
         z3qciQNqcavwoaHyhrNxWcNiTEmilQippFOwStONOgU0Is8nm0grU6MAvbRfLO4Pfcvq
         m1XBXTuinETozghHZ9HHjaTZOf6yL3/ov5Q37dMp9g6OvDvl6W0F9H8n3aWIBlVp4LRe
         /E8aUa1rnMI50HsAPmJVO2rrpGBZrqNJBtDQDi2UEIp3Ppc++poQ9cxIcCRZa25uYAx8
         mdFcL6WjzzMljYoG+k0zpLjtLfpGoswvuOQXRfPZ5RBeVV/JYbPqqOmXruiKY2pRTV73
         TSQA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="OyUL8/7N";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p17-20020a0ce191000000b0065b06024b4asi1670193qvl.317.2023.09.25.04.05.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 25 Sep 2023 04:05:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="OyUL8/7N";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qkjPL-0006bg-Q9; Mon, 25 Sep 2023 07:05:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1qkjPJ-0006aY-Qw
 for qemu-arm@nongnu.org; Mon, 25 Sep 2023 07:05:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1qkjPH-0003Tg-RQ
 for qemu-arm@nongnu.org; Mon, 25 Sep 2023 07:05:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1695639939;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tSiXhg7O6fxSFsDaE+jTLIFbtfmyKZG1tiIh/KHykFc=;
 b=OyUL8/7NFWDcRi09aUzqIzHsrMGZRVdqWsXaexujWUvlQoUOfFgRgGDeX94rf16oHFITbg
 2W+VGys9nrOI6pPiU10fkZbWFBsaamGeg3whA3zkhA0REO3VlbrXZPM8SfbuU+D2wWLrG7
 Sk7yQxMyFxx1k/vMvhA0+RFd3IoKZfQ=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-576-KRqn2h0aO22BKQkZTTMpRg-1; Mon, 25 Sep 2023 07:05:37 -0400
X-MC-Unique: KRqn2h0aO22BKQkZTTMpRg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C598A29A9D4F;
 Mon, 25 Sep 2023 11:05:36 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.25])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A28A140C2064;
 Mon, 25 Sep 2023 11:05:36 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id A02EB21E6900; Mon, 25 Sep 2023 13:05:35 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org,  qemu-arm@nongnu.org,  qemu-ppc@nongnu.org,
 Eduardo Habkost <eduardo@habkost.net>
Subject: Re: [PATCH v2 00/15] hw: Use QOM alias properties and few QOM/QDev
 cleanups
References: <20230203145536.17585-1-philmd@linaro.org>
 <06ed6fa4-1891-998c-f962-bf5a635c23fd@linaro.org>
Date: Mon, 25 Sep 2023 13:05:35 +0200
In-Reply-To: <06ed6fa4-1891-998c-f962-bf5a635c23fd@linaro.org> ("Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9=22's?= message of "Tue, 19 Sep 2023 14:35:34
 +0200")
Message-ID: <877coe8qdc.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: 12
X-Spam_score: 1.2
X-Spam_bar: +
X-Spam_report: (1.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_SBL_CSS=3.335, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: J7nfz3liBZes

Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org> writes:

> On 3/2/23 15:55, Philippe Mathieu-Daud=C3=A9 wrote:
>> Since v1:
>> - Addressed Markus & Zoltan review comments
>> - Introduce/use qdev_unrealize_and_unref()
>> These patches are extracted from a QOM/QDev refactor series,
>> so they are preliminary cleanups noticed while working on it:
>> - Use correct type when calling qdev_prop_set_xxx()
>> - Unify some qdev properties in MIPS models
>> - Replace intermediate properties by link properties
>> - Remove DEFINE_PROP_DMAADDR() macro which is used one time
>> - Use qdev_realize_and_unref() instead of open-coding it
>> Philippe Mathieu-Daud=C3=A9 (15):
>>    hw/pci/pcie_sriov: Replace fprintf(error_pretty) ->
>>      warn_reportf_err()
>>    hw/qdev: Introduce qdev_unrealize_and_unref()
>>    linux-user/syscall: Do not open-code qdev_unrealize_and_unref()
>>    hw/pci/pcie_sriov: Do not open-code qdev_unrealize_and_unref()
>>    hw/i386/sgx: Do not open-code qdev_realize_and_unref()
>>    hw/ppc/sam460ex: Correctly set MAL properties
>>    hw/arm/nrf51: Alias 'flash-size' QOM property in SoC object
>>    hw/arm/fsl-imx: Alias 'phy-num' QOM property in SoC object
>>    hw/usb/hcd-ohci: Include missing 'sysbus.h' header
>>    hw/display/sm501: Embed OHCI QOM child in chipset
>>    hw/display/sm501: Alias 'dma-offset' QOM property in chipset object
>>    hw/display/sm501: Unify common QOM properties
>>    hw/qdev: Remove DEFINE_PROP_DMAADDR() and 'hw/qdev-dma.h'
>>    hw/mips: Declare all length properties as unsigned
>>    hw/mips/itu: Pass SAAR using QOM link property
>
> Ping for review?

Needs a rebase.  I reviewed some all the same.  If you want more from me
before you respin, let me know.

