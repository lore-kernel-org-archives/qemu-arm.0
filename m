Received: by 2002:a17:906:b00f:b0:9d0:bf65:29fa with SMTP id v15csp532700ejy;
        Tue, 21 Nov 2023 07:03:02 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF7bMp0kyX9VkBlBniQXrwvaO++cYC0BJfz573nd61mi1diEDySt+ZrJtTjPdJe83ZL1tTS
X-Received: by 2002:a05:620a:11ab:b0:775:ed1e:2741 with SMTP id c11-20020a05620a11ab00b00775ed1e2741mr11258485qkk.7.1700578981766;
        Tue, 21 Nov 2023 07:03:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1700578981; cv=none;
        d=google.com; s=arc-20160816;
        b=lZxnzFYpav/B02yYKN09bxDzSn+Qph68Z2N/S+04mopEn7oXXhryNf7gzmrVswb+D5
         xwrDZZ0OsFFNx21AIvFpK8nMKFFFoSIddwW4nJhdFGI22ZCmDyy9kp/vQ8T4ghBfPdWE
         Amb5ujxl1WrEWsDBQbIW7NIO0X3iyRuUtREhd+6Xx8PeAjkJgfZ1EMuisFdw6UAesFJE
         bEpMY5aGZHoOG3z4S/kSDvwCvqcKAvqaQC748sA/7oOuAaAxv4bhVz7A1UCcDuS7yQ1K
         74k3x0UEGRrzz3BiETeY/oAkAw2BAu5WWgsOyBYEdChZFFHGd7FaUyPuHEtjWfPZrzB/
         j6xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-disposition:in-reply-to:mime-version:references:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=Xj6bOe15SjEXGuEeQ7OcNnEF7Df77Zf9Da3M1Rgxc+g=;
        fh=CsdiWNFHKpDi85bv+LYNHOHQERFxFhU1c1y9HbqB3eA=;
        b=TGI91L44tg6uNgVtsD/nNNSF/jwjsBLWjX32K+LLfvWGYy6lWk5mVSpjlpjtVHqIsS
         Pw0xtNeFvxWJoFrLvhAg2qg1EoNbZAYTpQPKEPVe2B1Ip0yxmxsEg/U0j8ZJY+BskYdB
         AUQZ6/7m/sNrSmSW7LKYSuRuFoA7MUKBAGBYcmIKzIludFYWULC03KxfSyZuEHw2UYDE
         4NIK0UVM2AtBsuP+T+vXyshaiXluN8TrftV30fYZ2uxsswkqqADWx8p1CUVioquxZzKA
         LzffvgF01Nv411Sa7ibRGFQeyZPXii+LKp5XFLwoNvHRYh+GO0iRyGhyADzoyLHhjamM
         ndwQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=hfa9MhLo;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d5-20020a37c405000000b0077a62fe9097si9617367qki.745.2023.11.21.07.03.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 21 Nov 2023 07:03:01 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=hfa9MhLo;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1r5SGo-0000O2-6U; Tue, 21 Nov 2023 10:02:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1r5SGm-0000NO-1o
 for qemu-arm@nongnu.org; Tue, 21 Nov 2023 10:02:32 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1r5SGj-0005Bg-Gu
 for qemu-arm@nongnu.org; Tue, 21 Nov 2023 10:02:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1700578947;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Xj6bOe15SjEXGuEeQ7OcNnEF7Df77Zf9Da3M1Rgxc+g=;
 b=hfa9MhLo8fHyUPoD2MKKVp1jiUiaBusDx7awjPudWC3zhUHVOkDXoaGb6nibkuQkiCavmx
 f1eyUZ4TpfpRA6D/kSjbS2X+KH4vMHX6MLi5fc86EhIbFuB9feONopm49r29UhZGGwlzXu
 VPmLjVR3GgomO4ngVSl/VPU+lMMLpfM=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-613-G_AUCfAvOPiP2hzvV0M2AQ-1; Tue, 21 Nov 2023 10:02:25 -0500
X-MC-Unique: G_AUCfAvOPiP2hzvV0M2AQ-1
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-66d7b75c854so16164526d6.1
 for <qemu-arm@nongnu.org>; Tue, 21 Nov 2023 07:02:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700578945; x=1701183745;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Xj6bOe15SjEXGuEeQ7OcNnEF7Df77Zf9Da3M1Rgxc+g=;
 b=GKt6H2ADSVWu2nK1ToI4MZULmjEfv2zxvxVL8aRBDU1RlxovYrpdBIesZy03QuN/0X
 I5oyvjUP6CgQktQfFQomp0msSI8J04O+HAoliDjujche606B7LzkRnN6aKTX9vHKtiem
 3GRt2mKH83daeoURWxuAH7/21G7Acl3qt/rtTn2/AbrvGTVl/JHm0dcK1AvME05qoac4
 9SGg0i5/DH9+dRXR4fbwqeUdMTTa9qKexYPcbN9/Vo1mBfm/NTaydSik0bHY0u7d4ydn
 fpEDDvUYNgcD3NKfFYrYHgk5Fk4Ovw0lXz14eqiRQ67KTwwjpTTjxSx5OMaGJ0IfSi6b
 pj2w==
X-Gm-Message-State: AOJu0Yy7KtQ7gMEyS6Ac4/PdyWbc+whEVjy0560yOR3el7Z1W07jJgGf
 RGfhp1VK6iP5SFEnxnCucRVVfq4sEEMFjWz+zOMPdOcmcD/xtDmM9PZ5TS9gQ/7iCI8x+0kAKOG
 pRoSK8rD7W8ni
X-Received: by 2002:a0c:f98e:0:b0:671:9945:7a36 with SMTP id
 t14-20020a0cf98e000000b0067199457a36mr10875012qvn.1.1700578945137; 
 Tue, 21 Nov 2023 07:02:25 -0800 (PST)
X-Received: by 2002:a0c:f98e:0:b0:671:9945:7a36 with SMTP id
 t14-20020a0cf98e000000b0067199457a36mr10874986qvn.1.1700578944867; 
 Tue, 21 Nov 2023 07:02:24 -0800 (PST)
Received: from x1n (cpe688f2e2cb7c3-cm688f2e2cb7c0.cpe.net.cable.rogers.com.
 [99.254.121.117]) by smtp.gmail.com with ESMTPSA id
 dx5-20020a05620a608500b0076cc4610d0asm3683364qkb.85.2023.11.21.07.02.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Nov 2023 07:02:20 -0800 (PST)
Date: Tue, 21 Nov 2023 10:02:11 -0500
From: Peter Xu <peterx@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, David Hildenbrand <david@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-arm@nongnu.org,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Markus Armbruster <armbru@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, qemu-ppc@nongnu.org,
 =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>
Subject: Re: [PATCH-for-9.0 11/25] memory: Have
 memory_region_init_resizeable_ram() return a boolean
Message-ID: <ZVzGc-jGpzYS5U7l@x1n>
References: <20231120213301.24349-1-philmd@linaro.org>
 <20231120213301.24349-12-philmd@linaro.org>
MIME-Version: 1.0
In-Reply-To: <20231120213301.24349-12-philmd@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -5
X-Spam_score: -0.6
X-Spam_bar: /
X-Spam_report: (-0.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_SORBS_WEB=1.5, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
X-TUID: Q8ZC/tdT+1s7

On Mon, Nov 20, 2023 at 10:32:45PM +0100, Philippe Mathieu-Daudé wrote:
> Following the example documented since commit e3fe3988d7 ("error:
> Document Error API usage rules"), have cpu_exec_realizefn()

same

> return a boolean indicating whether an error is set or not.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>

Reviewed-by: Peter Xu <peterx@redhat.com>

-- 
Peter Xu

