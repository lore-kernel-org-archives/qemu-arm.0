Received: by 2002:a17:906:fc12:b0:98d:b2f5:1316 with SMTP id ov18csp1989517ejb;
        Mon, 31 Jul 2023 00:11:31 -0700 (PDT)
X-Google-Smtp-Source: APBJJlE0mPbtErbgFvod5uqHFFkE+XHTV1COKCXF5d5e154WFZXhiLTxhdtvAuZwE2v5SroPgquR
X-Received: by 2002:ac8:584e:0:b0:400:a976:fc71 with SMTP id h14-20020ac8584e000000b00400a976fc71mr10930525qth.65.1690787490945;
        Mon, 31 Jul 2023 00:11:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1690787490; cv=none;
        d=google.com; s=arc-20160816;
        b=NpS4ZZqB9FspiJlC03yf9DXf07grnbXdBNCkkujsTLiMnroffexlHozk/eXC8l1t4L
         jQcYEXYOCiKzG5Yf6Ejqw008uYzMeRlEctekxfGR8SQQfnv8hUUvV6cK5frUXHnIQgJ0
         iEvB/cKKdeq4tCOyr8myDdRK87qtwuC5NR0KM4OIt9V1uuiDVqVW/gdce1jaQEgkf67D
         P6roBzq/BrSfInjVBccYDkDgRE1wwPBJJjomKU4hKJKPGMikR7xMUDVrbg5l6efuUA1E
         qzmwv0yoQ17fqwJYrKt+IQpS0JGql4icpvYnEv1u181fTJr9mrx/z7EZHspjlMWSM9nD
         Jamw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:mime-version
         :message-id:date:user-agent:references:in-reply-to:subject:cc:to
         :from:dkim-signature;
        bh=97SZbhHhpKZJwViHq3gl/J7JMzp4oVlAu7PbuWvp4aM=;
        fh=TCbab/j+qN4N0tNBD9x0jAar6g0smn1GdA420H+VR0g=;
        b=LTWuugUo4bEP2BRC7Mg/ZAdylvt+2LcFTBcQXwmZXNXRJ4pXB0FIGPsV/KAFtcM6pA
         QwB7FtjcqtU80rtjgYNEYLxiKjd23caNB1oH5W0UZXoeohATcUGDecmF7T9+eIWuhOyI
         dCJjJsvqgVpDROog4rNnVPWRHI/j7jNCzSJSNkW9uhYWoWlKteGl20Nbmvqm3BU1Gm2h
         54G+JQ5Ur115B3D7eJFU5mKJHlHIMNOFjoc6nvUfDJp40FgpwC1SgGRZ5NgIDHOYVVqs
         UrJnCOJOQJg74N0MvX1oMEz3THAh6uR4UzlynYBZmp9jtNMBn9yi3CwnOEBC1D9/tmxc
         nxBA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=gOb6Hgzc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t9-20020a05622a180900b00403ea2fc4d0si5528060qtc.293.2023.07.31.00.11.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 31 Jul 2023 00:11:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=gOb6Hgzc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qQN3V-000201-OB; Mon, 31 Jul 2023 03:11:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1qQN3U-0001zi-Nn
 for qemu-arm@nongnu.org; Mon, 31 Jul 2023 03:11:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1qQN3S-0003XM-Ci
 for qemu-arm@nongnu.org; Mon, 31 Jul 2023 03:11:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1690787457;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=97SZbhHhpKZJwViHq3gl/J7JMzp4oVlAu7PbuWvp4aM=;
 b=gOb6HgzcrPfEh/v/sG923nFkOol+OW7VsYJxOrixlpSC7f8XjHtrSsTlSlbvt2CjQS6PEC
 rvSZOWNXCAeTXyafTwR9czcMzeZJKKqUIzzCJOJ45AaRXcK4tNOp+Y0jOeNbaXKBKArwsS
 OJtMByL2cWq8QLEj1QhzZukQtYKoLTc=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-124-tt8xSuRfOByZUD3i5nH4WA-1; Mon, 31 Jul 2023 03:10:55 -0400
X-MC-Unique: tt8xSuRfOByZUD3i5nH4WA-1
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-3176c4de5bbso1880246f8f.0
 for <qemu-arm@nongnu.org>; Mon, 31 Jul 2023 00:10:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690787454; x=1691392254;
 h=mime-version:message-id:date:reply-to:user-agent:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=97SZbhHhpKZJwViHq3gl/J7JMzp4oVlAu7PbuWvp4aM=;
 b=J6DzZ4LZZUm33cbxRtXPsDLByrBysWEaWZYoSdZNWivmBxb5w/bxLtk1X1r6fWzZhY
 HlObxi1nF0XrzTLxoomVHYkB7qV45IzpJP1YRAQm+syoqT3pyLAgeEJA/6+RY3CmaWXT
 lDijNZiNEuW4Zjem6ZolyVqKSndrk+v+g7VOzG43kdK47QS3IhjHTmJZ5IXN4+DNaLSv
 rqH359VWFmXjHwRYRrKCc5lKPbaJZ14HfXgcTYovtvxOrGQdZNxViQwsIUEiV3boOuOp
 9mIPGUumVlyaqc3XKzmWjwmAMGBZr44LVh5BbGUujFdz5oMOyqMXbvIStPh5bWrlLzXv
 57jA==
X-Gm-Message-State: ABy/qLam0z/DCLxlNnFwD52BgX3lethFz0+t+xJAqgcf/vb/AEfkYt3z
 4Cppcr8+Qej5ohAwOG0YRbjj7V39BGpkaHD3jOQyi2gXuzl2dALnm2caf1lXOMBIMhrrrOXKzdQ
 cNADB4RoWQmUY
X-Received: by 2002:adf:e94f:0:b0:314:3611:3e54 with SMTP id
 m15-20020adfe94f000000b0031436113e54mr5395526wrn.9.1690787454797; 
 Mon, 31 Jul 2023 00:10:54 -0700 (PDT)
X-Received: by 2002:adf:e94f:0:b0:314:3611:3e54 with SMTP id
 m15-20020adfe94f000000b0031436113e54mr5395493wrn.9.1690787454457; 
 Mon, 31 Jul 2023 00:10:54 -0700 (PDT)
Received: from redhat.com (static-92-120-85-188.ipcom.comunitel.net.
 [188.85.120.92]) by smtp.gmail.com with ESMTPSA id
 u13-20020a5d514d000000b003172510d19dsm12144765wrt.73.2023.07.31.00.10.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Jul 2023 00:10:54 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: Akihiko Odaki <akihiko.odaki@daynix.com>
Cc: Christian Borntraeger <borntraeger@linux.ibm.com>,  Thomas Huth
 <thuth@redhat.com>,  Peter Xu <peterx@redhat.com>,  Leonardo Bras
 <leobras@redhat.com>,  Peter Maydell <peter.maydell@linaro.org>,  Richard
 Henderson <richard.henderson@linaro.org>,  "Edgar E. Iglesias"
 <edgar.iglesias@gmail.com>,  Brian Cain <bcain@quicinc.com>,  Paolo
 Bonzini <pbonzini@redhat.com>,  Eduardo Habkost <eduardo@habkost.net>,
 Song Gao <gaosong@loongson.cn>,  Xiaojuan Yang
 <yangxiaojuan@loongson.cn>,  Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>, Aurelien Jarno <aurelien@aurel32.net>,  Jiaxun Yang
 <jiaxun.yang@flygoat.com>,  Aleksandar Rikalo
 <aleksandar.rikalo@syrmia.com>,  Chris Wulff <crwulff@gmail.com>,  Marek
 Vasut <marex@denx.de>,  David Hildenbrand <david@redhat.com>,  Ilya
 Leoshkevich <iii@linux.ibm.com>,  qemu-devel@nongnu.org,
 qemu-s390x@nongnu.org,  qemu-arm@nongnu.org
Subject: Re: [PATCH 2/3] tests/migration: Add -fno-stack-protector
In-Reply-To: <20230731065904.5869-3-akihiko.odaki@daynix.com> (Akihiko Odaki's
 message of "Mon, 31 Jul 2023 15:58:55 +0900")
References: <20230731065904.5869-1-akihiko.odaki@daynix.com>
 <20230731065904.5869-3-akihiko.odaki@daynix.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Mon, 31 Jul 2023 09:10:53 +0200
Message-ID: <875y60d08y.fsf@secure.mitica>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Reply-To: quintela@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: qxxKFONxCz8O

Akihiko Odaki <akihiko.odaki@daynix.com> wrote:
> A build of GCC 13.2 will have stack protector enabled by default if it
> was configured with --enable-default-ssp option. For such a compiler,
> it is necessary to explicitly disable stack protector when linking
> without standard libraries.
>
> Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>

Reviewed-by: Juan Quintela <quintela@redhat.com>

For whatever is related to migration.
My liker options skills are (very) rusty, so I will let others decided
if this is the correct way to do it O:-)

