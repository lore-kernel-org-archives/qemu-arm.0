Received: by 2002:a17:906:3b11:0:0:0:0 with SMTP id g17csp1683556ejf;
        Tue, 16 Aug 2022 02:43:46 -0700 (PDT)
X-Google-Smtp-Source: AA6agR4DwaRf6pPdgMuGcJfF7BtioatzQbKb9vcx+ZXqlcY8zS3qrZydGB7O7OnEWmMeqxqBP53E
X-Received: by 2002:a0c:f4c5:0:b0:474:8a1b:9043 with SMTP id o5-20020a0cf4c5000000b004748a1b9043mr17001420qvm.91.1660643026310;
        Tue, 16 Aug 2022 02:43:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1660643026; cv=none;
        d=google.com; s=arc-20160816;
        b=dxiwmT2VZ6mfQa8VWm2tini+3TGaAA/KVYMOWXOpOfhME3RIEDIymFce+Q5UP4t6RO
         gFtpztZ8JPeeWRsRuCXwAMTufqZrmaKgghMf2CzDzMUGB8ES55STyAtXip3+i5DAEh/4
         rNicKO8fg4TTFNanafbPX5eUnYT3Z8J8lJLkFvwmiod2whJHeZ8sGfjHdi5aQV/9yyYj
         n/0xwhdU7wduHDV4ktuQohBNdzDHY55DoCxRrIT+JRkQQ3RGl++60A0kHKxEYfIHKBZs
         zQwo/Kl2SwXYuXMlsNX4l3uQQGPCBFEjn29pHdwIuDfh5OfULphTJVNFo4Wh1OOG0V5O
         LDhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=W4GJy3HUABuR1m0+ypJ5X+91KTe/nI7ywDys/lKOW2U=;
        b=mNLf994+2vbcjlb6VFq+dv6+NcyJE1VxFYhjLB382uuLpONOfVO9aedp4r+iaE0h+M
         tfjiFjuKjEGhWBspN2AbeBZDPaSrVx69i0M+UOv+XfZl/Kl0ZuLiFSMiKuHAPt+fMdpK
         PiwH1pi9+316uUyO+J0a2NAqtNp92H7Orcs3b+4KqVcW96bqo/ewfVJv573szTOKelaD
         IM4dZR3qoWIt0jyKxB1AWjlDAUjaN+BGM1bNGzBgSvPckQ+vmenWXwpk8ZJa/XpLP+39
         b7mqQwI2OPRldhaGixzne+HXeVrSG8wUfhGmy/rXSuMQerUN2wGEggVuDeQzDt+tbDb+
         sWrA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=bm0Yan2+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bt8-20020ac86908000000b00342c46c9a05si6776861qtb.704.2022.08.16.02.43.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 16 Aug 2022 02:43:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=bm0Yan2+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:56382 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oNt6v-0006lv-Rc
	for alex.bennee@linaro.org; Tue, 16 Aug 2022 05:43:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36004)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oNt5p-0005uB-J6
 for qemu-arm@nongnu.org; Tue, 16 Aug 2022 05:42:37 -0400
Received: from mail-yw1-x1130.google.com ([2607:f8b0:4864:20::1130]:39761)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oNt5o-0006K0-2V
 for qemu-arm@nongnu.org; Tue, 16 Aug 2022 05:42:37 -0400
Received: by mail-yw1-x1130.google.com with SMTP id
 00721157ae682-32fd97c199fso111672527b3.6
 for <qemu-arm@nongnu.org>; Tue, 16 Aug 2022 02:42:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=W4GJy3HUABuR1m0+ypJ5X+91KTe/nI7ywDys/lKOW2U=;
 b=bm0Yan2+tZFCLrB8iaOBQ2/uCQvg323xJQArSXcz8m1n2QQEiXA6uxE1DGj2C47PQY
 396z3mYT8p64AGnxcs0WK/4GjHVWtwd1cPLZBvK74YHsm0wQwv14qMb/ygMGGQ43UEAK
 wvmL8nsYtI8FDotLQaFcfi0rkarQ8LHEJCLyBId1xjzD9f+SWTK8Pi48Y8XKl5lzUPhJ
 q/6wz2fc/Q+mu53ML45kJEJCfuXVluogC7Bx5NDGLibRwqOxYHk9Ji9TxA/oktrdmi+s
 CvaxO9DEhOXck/IxdWPvphegykKNldc6ZKWldfuV/l3gkCLvB91McKklXnt/N6X/t2D8
 j6xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=W4GJy3HUABuR1m0+ypJ5X+91KTe/nI7ywDys/lKOW2U=;
 b=yR4zfXtWjHfC9oMep+F7UuLV+Xc5PxGO6+PUOJJvTbDi2T4OEKRUt6iZQbEH8z1+aB
 mKFk4YckgCRQgxROkz/8W3GhFSlYcmfFV/AQvUJ/4qbjlPPEcaTHs3Ejzp7yjVbqhE90
 xaRtRyQcV3mTKOM91w/ItrdwUKZxZ98TEjkZHyu0UxO6TN7USmOW3YC3sezv4X77JwLM
 zFls/RCqeCZSMCWachnUKp9HKvMJhitYUHEqwv+rKG+ap45db7oey31asEtTOgwEOM6V
 BIOrwXee0ev8UBQm6dK9h/LdG54lQ4sO77zby7BYkkNgCwLLp+9iY2GyyRrylDvM1Uqa
 jOUg==
X-Gm-Message-State: ACgBeo3SN5ACGvlL9hOjGBYo2ias+Q7a/rp7wv90NULfTFLv2wpeeeJg
 Esq3mUqCE1+M1ke6p1vyfClF8vKPWQlEq1KUpJIy7A==
X-Received: by 2002:a25:55c2:0:b0:684:4159:38f4 with SMTP id
 j185-20020a2555c2000000b00684415938f4mr11614921ybb.288.1660642955133; Tue, 16
 Aug 2022 02:42:35 -0700 (PDT)
MIME-Version: 1.0
References: <20220816092624.15168-1-zhukeqian1@huawei.com>
 <CAFEAcA8UN=NABfNzzP-m5b3ki5mKH1qyfwgi6_yiT__6u_-1ng@mail.gmail.com>
 <47f60df98b514502b422adee6b970880@huawei.com>
In-Reply-To: <47f60df98b514502b422adee6b970880@huawei.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 16 Aug 2022 10:41:53 +0100
Message-ID: <CAFEAcA-DtHrfCF0nfvnrW6bTmjRco_rxu=vj3yNciBkM_0iUog@mail.gmail.com>
Subject: Re: [PATCH] acpi_ged: Add ospm_status hook implementation
To: zhukeqian <zhukeqian1@huawei.com>
Cc: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>, 
 "qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>, 
 Eric Auger <eric.auger@redhat.com>, Peter Xu <peterx@redhat.com>, 
 Igor Mammedov <imammedo@redhat.com>,
 "Wanghaibin (D)" <wanghaibin.wang@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1130;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1130.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Tta3BL0j0QN1

On Tue, 16 Aug 2022 at 10:40, zhukeqian <zhukeqian1@huawei.com> wrote:
>
> Hi Peter,
>
> Setup an ARM virtual machine of machine virt and execute qmp "query-acpi-ospm-status" can trigger this bug.

Thanks. That is worth stating in the commit message, I think.

-- PMm
