Received: by 2002:ad4:4a74:0:0:0:0:0 with SMTP id cn20csp27063qvb;
        Wed, 13 Jan 2021 05:46:36 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxsvAOH6iyZ3HZFT8Ns8+dMR96areFYUCp5ZxIm3sftATjt3CcNbkaJLbOZ6I9NI1tzntp5
X-Received: by 2002:a5b:7cc:: with SMTP id t12mr3340309ybq.102.1610545596556;
        Wed, 13 Jan 2021 05:46:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1610545596; cv=none;
        d=google.com; s=arc-20160816;
        b=OmORgGax1AoxZWD40lq8NRe8YNOdbkOeAu7QL3Qcp1vCkIOnbU4XMsO/1JlddttBMG
         ytSAiTQquHpVVeHpzL4/vytkA/6WHjCTPkBupWmdB0TqTvhscQPa3hBduIa8MzmRKlSz
         F5xSx+VjsK4FvVTOH4IiTjQHQ9wJd3it7RpefRALefoh6aWp+SxIz+MHl/V4LwHohYvY
         PO8jdkOQKf3E8niHOkUcgXhSocLHy/KYAmgZYvMPDeUEi08w7vP5HYUrMxCfvV+zzDfl
         8lrxDAsaVZ8kUpT3WrIbxwMX9qq5AeOKDUtiiguql1FkbDUm4OivpjHyeLxJbl5tF+tb
         j0og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:in-reply-to:subject:to:from:dkim-signature;
        bh=mC5y+NPr62yYqrU3YGwTiiHBkagQzXTh1WGcEASNq0o=;
        b=NTE75AZnw5uXNhISDfpmIOQxYQ64MUG/bJrA/VexS63RVctZ2FgVEMDH8YjwKXwWMZ
         kBDqggG5NUA4KXCqqR/M/gmKnsSkvdCzA5Ug9iCV/8YPYBFUItpnvDVk8VOeqCCKx6mJ
         EGs2r8gZs5LQsVC1FP058M45i/2uFZxXz9Jwy6GxjAUYyzS72Brs77alNaeD9av7phzL
         V8BJ/GDZyXVuNVen1B444AsbBbHFABhWw5jvFEnYDHPM2S1zk8mMSX4U/LiG3PgytV/5
         Xx2twM0A9xNhYsGJznTaVHnNiwQUQbXqy6mT5n3ABoa5jWRJlG+dA+SZkXWkaw1aYM9Z
         xGkg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=VF5EPY3+;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c3si2204428ybn.371.2021.01.13.05.46.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 13 Jan 2021 05:46:36 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=VF5EPY3+;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:46654 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kzgTs-00035X-3b
	for alex.bennee@linaro.org; Wed, 13 Jan 2021 08:46:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43242)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1kzgRg-0001zc-O8
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 08:44:20 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:35452)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1kzgR7-0002M2-HH
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 08:44:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610545423;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mC5y+NPr62yYqrU3YGwTiiHBkagQzXTh1WGcEASNq0o=;
 b=VF5EPY3+Kn+Q8YuQoH7V86fV4vX9ZHvXDabeWnxLsF2fTUuVmsSANJXoNhwtBywj4ZHdh7
 1u7ht+lA44DAISqGl/Ss0DjNLKinziTBr1m5VoqifzsNal+dBKned5IVk4+L7GX0Bo3mtj
 VmFAZKgwuX7WlfmUdNyx1buQlP1mr18=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-518-l1rrS3PSMq6MjtbOBHg3Dg-1; Wed, 13 Jan 2021 08:43:42 -0500
X-MC-Unique: l1rrS3PSMq6MjtbOBHg3Dg-1
Received: by mail-wm1-f72.google.com with SMTP id b194so309584wmd.3
 for <qemu-devel@nongnu.org>; Wed, 13 Jan 2021 05:43:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references
 :user-agent:reply-to:date:message-id:mime-version
 :content-transfer-encoding;
 bh=mC5y+NPr62yYqrU3YGwTiiHBkagQzXTh1WGcEASNq0o=;
 b=Ah6mL2+0faueEPcCLjsPngoV2Brz3oBZ6YDEX7rM9cc2vESYVZKY0CEsOcB/DG35eX
 FPvW3P4lbyLiCpQeom/fH3qb0q40L/a9hSns6wv+kww+pTdFGr1Dz9hSmWpUA269wX75
 b7Vd40MloQGQi7PNcLZ0pSE5p2FZFYSQ44EoioKbeOIqshRL5zeaiWlPeQ1Qy4rTCwMA
 qvvM+z37KiV8pDf/m+ZvqgboxmBVqNNUiMTEwe4IelausELjboboRDWHVKAMYovlJMhU
 OBN4zhpeaOzjggMR5mKkfMh7yqbbmPLsd/atQoo4vuLNRTpvySgeWdrt72gtSe98ebN7
 aumA==
X-Gm-Message-State: AOAM530ALaGJk6rHek6kvGv9ipsV25d/hDtTuXHzDrcNsYyJCDJA4/Al
 +aXpl6rgHrQkD/xxBQbQhKhiJBJYaMJj92M1kZoIrWO3PREwhnKFZJR7G+0mA69g92BqQB0rxxa
 BeP/9sUXEg8wNNhA=
X-Received: by 2002:adf:ef8b:: with SMTP id d11mr2762437wro.156.1610545420906; 
 Wed, 13 Jan 2021 05:43:40 -0800 (PST)
X-Received: by 2002:adf:ef8b:: with SMTP id d11mr2762418wro.156.1610545420693; 
 Wed, 13 Jan 2021 05:43:40 -0800 (PST)
Received: from localhost (trasno.trasno.org. [83.165.45.250])
 by smtp.gmail.com with ESMTPSA id t188sm3014743wmf.9.2021.01.13.05.43.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Jan 2021 05:43:40 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: Re: [RFC PATCH v6 05/11] hw/ssi: imx_spi: Rework imx_spi_reset() to
 keep CONREG register value
In-Reply-To: <20210112183529.2011863-6-f4bug@amsat.org> ("Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9=22's?= message of "Tue, 12 Jan 2021 19:35:23
 +0100")
References: <20210112183529.2011863-1-f4bug@amsat.org>
 <20210112183529.2011863-6-f4bug@amsat.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
Date: Wed, 13 Jan 2021 14:43:39 +0100
Message-ID: <87eeipgdf8.fsf@secure.mitica>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=quintela@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=63.128.21.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
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
Reply-To: quintela@redhat.com
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Alistair Francis <alistair@alistair23.me>, Bin Meng <bin.meng@windriver.com>,
 qemu-devel@nongnu.org, Jean-Christophe Dubois <jcd@tribudubois.net>,
 qemu-arm@nongnu.org, Peter Chubb <peter.chubb@nicta.com.au>,
 Bin Meng <bmeng.cn@gmail.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: xIFlDXYgUZJE

Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> wrote:
> When the block is disabled, all registers are reset with the
> exception of the ECSPI_CONREG. It is initialized to zero
> when the instance is created.
>
> Ref: i.MX 6DQ Applications Processor Reference Manual (IMX6DQRM),
>      chapter 21.7.3: Control Register (ECSPIx_CONREG)
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

Reviewed-by: Juan Quintela <quintela@redhat.com>

I trust your reading of the documentation O:-)

