Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp4572066lft;
        Wed, 6 Jul 2022 02:34:40 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1uwLO4cWGqZqKQKR7pDKv/HkDo8+fqg4yzKKmyuCsQ+kIeuG5cVv78fHezsMCq+Ajzt5qCS
X-Received: by 2002:a05:622a:30a:b0:319:294b:cb88 with SMTP id q10-20020a05622a030a00b00319294bcb88mr31887120qtw.336.1657100080777;
        Wed, 06 Jul 2022 02:34:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1657100080; cv=none;
        d=google.com; s=arc-20160816;
        b=LkGDBZyuCfjQH7SIwaEMaYik1+soSUjOy9vgbpmx+mcmuiO4mKzEf3Wmpzwif23m8P
         QaZUDj3XxOIE+A4OqSYy6JKcOYJbeBgxJnoQFxlKaHlI+R5oIRL28mujRHDacFu+b/qa
         FzPS0uyqye5LMJG+0pX0af010HlkpRcWUctJ/SlhQk4IJI186931Utz4wz5Br6672VqC
         ROkV0Jlytu+JIgEdj/7kJNx3MPKqNN2WfhthODxcNxSZeS4KZyini2IHPQQUrJfOvXnK
         +WcIZSn8VTlpknktC8Y0yfN9PWXHad8HXhESrPe5Z78sQ7l7uxkSU5H71zN98dyRBZLm
         354Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=ZCrblR5e75Sx5FizphwHPCHa4vRuYb/Ub/Stwr788FY=;
        b=jMnVij2f5NS9VMU9bnvVjCa3TNsthrwJja/iJs4k9Ymbi791rTLcisJHXEmOS3lx6R
         KRLzdWawnsx3yZ6DXExuwD5TpNp42oR0lmIotjpGJLCP8NEDNuNGAg9OzzDZcjSgTWwv
         q99PKeBl8OsWeCA7lY2wgu8hNUDRLd6ib/LFfGDhrl+A2upyylngXy2DbxiJRRguv93c
         KNSO7ha9v5XOU/G5TA+k5fU977Hn7aGmafk9j7I9gxQvZu93HwF0W1BIe1WK9BiVCK5l
         8YC1/0G2GQ2EGZt5j/HJmpi0WLgfFbazpULgf6AdqD5Iuch1jB82H8h1S4Tn3SnEjoYi
         PQHw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ZocWAx0e;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 9-20020ac856e9000000b003051da8c70csi20582221qtu.441.2022.07.06.02.34.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 06 Jul 2022 02:34:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ZocWAx0e;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:50040 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o91Qe-0007mA-5J
	for alex.bennee@linaro.org; Wed, 06 Jul 2022 05:34:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52186)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1o90XF-0007P3-4C
 for qemu-arm@nongnu.org; Wed, 06 Jul 2022 04:37:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:59855)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1o90XB-0001Bf-Sd
 for qemu-arm@nongnu.org; Wed, 06 Jul 2022 04:37:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657096641;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZCrblR5e75Sx5FizphwHPCHa4vRuYb/Ub/Stwr788FY=;
 b=ZocWAx0ejlGAzlP1l6e1FvZZn3d3ZpE/fJrWDWtWlsKGjMS+XUMKREQYiWsP5ZDL+FXaYw
 s12Mh7+pk5BgclKE2uwgNdnZ6ryFFP0x4wOG2IuYRlCRCpNqK564qPkqPwsxauKtwoKjea
 VlqeGhqj4vNG8lc3tGi+mRJKN6EBIek=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-391-QV_YjeDOPYWjMj1V3glCzQ-1; Wed, 06 Jul 2022 04:37:20 -0400
X-MC-Unique: QV_YjeDOPYWjMj1V3glCzQ-1
Received: by mail-ej1-f70.google.com with SMTP id
 hq41-20020a1709073f2900b00722e5ad076cso3592986ejc.20
 for <qemu-arm@nongnu.org>; Wed, 06 Jul 2022 01:37:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=ZCrblR5e75Sx5FizphwHPCHa4vRuYb/Ub/Stwr788FY=;
 b=cr5xzj0H9xO91KJLN6YC88FaxD+swGLvgNODoVtdlekxwtTgo4AQkqMDuXUOtbcyKc
 irfqYF2tnCwIMkZ4WORV61njCIqBAEWOYHg1SefGCmQ7S4lQoTEtKJ9TM46KtZ4UkO98
 p4mGp/uimrQW8vUksbcR4GW39eoR+wvR27lf3l6C37jqjYY2yMpMJuU2icNByDk2Ofzt
 q4y5CGTi+Jm+Yt875nLv4UaZVYHGLRR7jSt8v+q/3VX7BE0SVF3nagGCj4ONVk/DkZ43
 2rWPTFmDAg5DEoqWuutbP2JClZo99wZaVgcv9uqYF2uyjYSfmMUpVNSlgMv83Wyj4+uX
 sq5w==
X-Gm-Message-State: AJIora+xS88vhoGTDqxRev1brF5efYuvgueuFSJZveXwkKjPGk3YeQoy
 CdNKnekLpIzBK6Bx3snTzKh76iIX4WKbq72T3igVWlchwCnjLRHidMnkL6FdnNyQAOfGWO2MEBt
 OKkv47uAtSQWC
X-Received: by 2002:a17:907:78ce:b0:726:a66e:eba1 with SMTP id
 kv14-20020a17090778ce00b00726a66eeba1mr36833118ejc.415.1657096638917; 
 Wed, 06 Jul 2022 01:37:18 -0700 (PDT)
X-Received: by 2002:a17:907:78ce:b0:726:a66e:eba1 with SMTP id
 kv14-20020a17090778ce00b00726a66eeba1mr36833068ejc.415.1657096638595; 
 Wed, 06 Jul 2022 01:37:18 -0700 (PDT)
Received: from ?IPV6:2a02:8071:5056:d40:63e3:25a7:c1a1:4455?
 ([2a02:8071:5056:d40:63e3:25a7:c1a1:4455])
 by smtp.gmail.com with ESMTPSA id
 a4-20020a170906274400b00726b03f83a0sm12717489ejd.33.2022.07.06.01.37.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 Jul 2022 01:37:18 -0700 (PDT)
Message-ID: <a0c487f3-c111-44cc-0f4a-c1ecbe85d769@redhat.com>
Date: Wed, 6 Jul 2022 10:37:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v2 01/18] block: Make blk_{pread,pwrite}() return 0 on
 success
To: Alberto Faria <afaria@redhat.com>, qemu-devel@nongnu.org
Cc: Beniamino Galvani <b.galvani@gmail.com>,
 Juan Quintela <quintela@redhat.com>,
 Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>,
 Eric Blake <eblake@redhat.com>, Niek Linnenbank <nieklinnenbank@gmail.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Laurent Vivier <laurent@vivier.eu>,
 Stefan Weil <sw@weilnetz.de>, "Edgar E. Iglesias"
 <edgar.iglesias@gmail.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Alistair Francis <alistair@alistair23.me>, qemu-ppc@nongnu.org,
 Fam Zheng <fam@euphon.net>, Jeff Cody <codyprime@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Kevin Wolf <kwolf@redhat.com>, =?UTF-8?Q?C=c3=a9dric_Le_Goater?=
 <clg@kaod.org>, David Gibson <david@gibson.dropbear.id.au>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Joel Stanley
 <joel@jms.id.au>, Bin Meng <bin.meng@windriver.com>,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 John Snow <jsnow@redhat.com>, Andrew Jeffery <andrew@aj.id.au>,
 qemu-riscv@nongnu.org, Greg Kurz <groug@kaod.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-block@nongnu.org,
 "Denis V. Lunev" <den@openvz.org>, qemu-arm@nongnu.org
References: <20220705161527.1054072-1-afaria@redhat.com>
 <20220705161527.1054072-2-afaria@redhat.com>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <20220705161527.1054072-2-afaria@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: CKB8eKTX9J4Y

On 05.07.22 18:15, Alberto Faria wrote:
> They currently return the value of their 'bytes' parameter on success.
>
> Make them return 0 instead, for consistency with other I/O functions and
> in preparation to implement them using generated_co_wrapper. This also
> makes it clear that short reads/writes are not possible.
>
> Signed-off-by: Alberto Faria <afaria@redhat.com>
> ---
>   block.c                          |  8 +++++---
>   block/block-backend.c            |  7 ++-----
>   block/qcow.c                     |  6 +++---
>   hw/block/m25p80.c                |  2 +-
>   hw/misc/mac_via.c                |  4 ++--
>   hw/misc/sifive_u_otp.c           |  2 +-
>   hw/nvram/eeprom_at24c.c          |  8 ++++----
>   hw/nvram/spapr_nvram.c           | 14 +++++++-------
>   hw/ppc/pnv_pnor.c                |  2 +-
>   qemu-img.c                       | 25 +++++++++----------------
>   qemu-io-cmds.c                   | 18 ++++++++++++------
>   tests/unit/test-block-iothread.c |  4 ++--
>   12 files changed, 49 insertions(+), 51 deletions(-)

Reviewed-by: Hanna Reitz <hreitz@redhat.com>

