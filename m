Received: by 2002:a17:906:b2c6:b0:930:eaf4:5c09 with SMTP id cf6csp4027746ejb;
        Tue, 21 Mar 2023 05:57:11 -0700 (PDT)
X-Google-Smtp-Source: AK7set9LvcWt/gmfeb0KtXTOxcuf1ddtS7ylkzwF1RYNbHdwpmkjI7b876fvqRUAA4HAxAToriFS
X-Received: by 2002:a05:6214:501a:b0:5c6:cd00:aaa1 with SMTP id jo26-20020a056214501a00b005c6cd00aaa1mr4073110qvb.39.1679403431432;
        Tue, 21 Mar 2023 05:57:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1679403431; cv=none;
        d=google.com; s=arc-20160816;
        b=yLkHaWNfYT2TzHZdvIo0a8XOpCJYbskaE/b6ASgE9ANgbwObaViYir0qZx9YwJu7Sh
         PDx28rWI8RiUfXTjhc8KyDGBRsHYaPIG8+HA/XogvjcV2Mw3ojlenRCSzSje3sbb6Dql
         F0+vmrc5+f795nOBYcALBlu3W2u0Ky4avhYGo0x3llyvOFlOizVO9tbE7G7egrpL+huB
         Uw1araQP9JbokjR6KG/2c50zZ9B6nTqAkFCmJ6dnL05GZdztvLhPvPfBGnhp2224rwLp
         3QgQiIh9HGrF50odCp1ELAayoHQqMA8ilXBUE2D3+vuRxt7Bl45tlGhda53mw0Hx6aYF
         Pi0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:in-reply-to:subject:cc:to:from:dkim-signature;
        bh=IiFVpn9jj6h337K3NSpiQFh78X4x0ZgqQ+4RHW0aroc=;
        b=qmLkFpn3YerE/NudGGNnm6ub3y9xdhIoXJhzlzXc7jC4XUSje35RKKO2BilrgbR1vQ
         35vikaEYlDJKPo57/Uzo6ZjWuHZEtbOLnS1YNI8HgZPPUOCwPETy9EzJbb3BKc6ZoDqP
         XIrgDZA+abcpY3LBpJhTM2B5lbHQt2JkF3QuXsTj0u4oy24+LHg6lF6uGPDaqFm07XXp
         YIUCG+1rWDq+2HLxGHRBD9l0xPFD8w2wrn1leBa2u9/n7ScbdNVDEgRQv/CnFw6v8edG
         q/4U+l/K7qM4sh4uYKl0oOLDceqHIkf2P2+r2kDfFtMGozpK4PKcHZizioL8r4j//2Up
         ppdg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Y0YdMsti;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a14-20020a05622a064e00b003de6d89ada9si4592777qtb.718.2023.03.21.05.57.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 21 Mar 2023 05:57:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Y0YdMsti;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pebXQ-00075V-HX; Tue, 21 Mar 2023 08:56:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pebXN-00074R-HT
 for qemu-arm@nongnu.org; Tue, 21 Mar 2023 08:56:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pebXL-0006ZH-Tv
 for qemu-arm@nongnu.org; Tue, 21 Mar 2023 08:56:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1679403383;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IiFVpn9jj6h337K3NSpiQFh78X4x0ZgqQ+4RHW0aroc=;
 b=Y0YdMstiVLYjwd4fNy+JvsvhQvuKsycCV64pISqD0N0XXBNEXhvuNjhcckrWIcwVcnJQsF
 nQbMRCjBbILW0Bt83+3a+qAG+aB8QYBMfo7gvwmJdYk/yrHUR1AP6SJu0s6EMqqJA19W64
 oKAn2gGQrE5XJfg86ykSK3CmAPSb8V0=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-615-fhZv2-SRNu-vk7ncA4Il5w-1; Tue, 21 Mar 2023 08:56:20 -0400
X-MC-Unique: fhZv2-SRNu-vk7ncA4Il5w-1
Received: by mail-wr1-f72.google.com with SMTP id
 b9-20020a05600018a900b002cfe70737d2so1742287wri.1
 for <qemu-arm@nongnu.org>; Tue, 21 Mar 2023 05:56:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679403379;
 h=content-transfer-encoding:mime-version:message-id:date:reply-to
 :user-agent:references:in-reply-to:subject:cc:to:from
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=IiFVpn9jj6h337K3NSpiQFh78X4x0ZgqQ+4RHW0aroc=;
 b=WD2R7ytACqoC89qqdriSWUMSMRbYfDkzAbGJJduc4ETdssB4ErHo94MLvKCSsyG0X/
 dtmDq+bbgE762a14BsTUV0kTxcLrZzFUSeCaYy4462ohnQfToX1CzLlST+rwpKEsqYon
 s5ysrxd+WBPmzgILZNQmCJ8Lmfg76AuHLntMfKqHcCCyISrwnNtI7KxI5vxluKygkhME
 9vRMwsyB3BvmVq1uYDl1mSsMgD2IGKZCDRLTWpw2pGqJ1yHqyD14g2nHrIw0FdUyQPUb
 7DK2QMe/bxPXOZnUyrRou/R/+nJqlvdFQI2MYfJ0Hfz1PvI/uPJM5QbtWDs/UgGW2GHo
 tMuA==
X-Gm-Message-State: AO0yUKUITp5mtzLfU8Cfq1PJUQcCHYaxND2XuMOb1fVDRRHgOGYKqMCC
 15ZAy8bYK8fkuemc27GAiyKk0aWe/XLUkBRLKFb+ME0nHhCIKqIvCh75e+pOtT4xRL4mCGNbnly
 PnOykkVCXFVSc
X-Received: by 2002:adf:edcd:0:b0:2cf:e3e3:5b01 with SMTP id
 v13-20020adfedcd000000b002cfe3e35b01mr2198736wro.56.1679403379798; 
 Tue, 21 Mar 2023 05:56:19 -0700 (PDT)
X-Received: by 2002:adf:edcd:0:b0:2cf:e3e3:5b01 with SMTP id
 v13-20020adfedcd000000b002cfe3e35b01mr2198722wro.56.1679403379508; 
 Tue, 21 Mar 2023 05:56:19 -0700 (PDT)
Received: from redhat.com (62.117.238.225.dyn.user.ono.com. [62.117.238.225])
 by smtp.gmail.com with ESMTPSA id
 p14-20020a5d48ce000000b002d45575643esm9247132wrs.43.2023.03.21.05.56.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Mar 2023 05:56:19 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org,  qemu-arm@nongnu.org,  qemu-block@nongnu.org,
 Stefan Weil <sw@weilnetz.de>,  "Dr. David Alan Gilbert"
 <dgilbert@redhat.com>
Subject: Re: [PATCH-for-8.1 5/5] bulk: Replace __attribute__((noreturn)) ->
 G_NORETURN
In-Reply-To: <20230320134219.22489-6-philmd@linaro.org> ("Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9=22's?= message of "Mon, 20 Mar 2023 14:42:19
 +0100")
References: <20230320134219.22489-1-philmd@linaro.org>
 <20230320134219.22489-6-philmd@linaro.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Tue, 21 Mar 2023 13:56:18 +0100
Message-ID: <87bkkmjma5.fsf@secure.mitica>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Reply-To: quintela@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: WLBJQ53sOBuy

Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org> wrote:
> Under MSYS2, G_NORETURN is expanded to '[[noreturn]]'.
> Simpler to use the same definition everywhere, unifying
> the code style.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>

Reviewed-by: Juan Quintela <quintela@redhat.com>

