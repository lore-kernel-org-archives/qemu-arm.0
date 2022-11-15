Received: by 2002:a17:906:80c3:b0:7ae:d8f:8937 with SMTP id a3csp3601458ejx;
        Tue, 15 Nov 2022 05:07:33 -0800 (PST)
X-Google-Smtp-Source: AA0mqf5Bt8rCnSsANUsfYjT/J3Vw2D3c8jkWzZVZ0o9jwL2Gqs3MDCX0YHHxU0fQ/agJfDW5gql3
X-Received: by 2002:ac8:5643:0:b0:3a5:6854:32fe with SMTP id 3-20020ac85643000000b003a5685432femr16531878qtt.655.1668517653737;
        Tue, 15 Nov 2022 05:07:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1668517653; cv=none;
        d=google.com; s=arc-20160816;
        b=qhCRMk9jf3SQJkbXdo2IciWrhFbUQxBvr/1N2S5PE71uC5EQSpenkALu0db+isMl9h
         sMkwsgSnnY/+rTcJKeD97zHBDHnDoERo/2mMD4/qBZ556bAGfgENIBbriUilt6IYoqcp
         SxYHZ9/IowKMMSTQDgTKS1poD/iYI3EwUPfuOwzc+00uE+VvkrsK9kEqRbZt2vNcgpvJ
         MH+yKYDRqvjqBkiv/6U4Mczk+Hgh92n1Z3aObhurehgenCQaI9m4hrT1SpbwW5uLZm/W
         gi9mltVB0frCYD9Iruce8JzEevtKp2O4XXP3+nxRVbHCike1RhBYylQdWly4fq11ugdj
         qD+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id;
        bh=PJtpEzAkpGrKv9GT1i9CUfX1kYz8eUcC2d61Y0r/6IA=;
        b=cfD0fv0dbIvj3sT663VfvNeme/mKxiqZiiScSAf44uS0vOkC/mz3ntdj3K7toI8dgn
         b/mMgm6TYpMoKGbHsJV9JS0xx7QdN4wJEPXofNUjvCmapMy37Owclh2Ha0hVhiC7IIKm
         btIok+7a7bJ4yE6DiBEbnTpBPGwfrw6RUcVE3lJ7+V3LpCiAMPLPrkKJbUQESyLGXE5N
         za+ijKsm69m+e3CQITZVRt5y+cqytf1yR2tW3Dse8CEOYV2coPAk1hcyRNmCbixNluL0
         ye3E/uq124oEl1nL4mUK+GM/oL7shu8bkcRbBNMxuOYAyVXShy1+hEAACJIcG3pMRt9f
         bekw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l4-20020a05622a174400b0039cbf9e3314si8010843qtk.680.2022.11.15.05.07.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 15 Nov 2022 05:07:33 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ouvek-0000Ux-0J; Tue, 15 Nov 2022 08:07:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1ouvef-0000OU-5A
 for qemu-arm@nongnu.org; Tue, 15 Nov 2022 08:07:10 -0500
Received: from smtpout3.mo529.mail-out.ovh.net ([46.105.54.81])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1ouveb-0006Wj-CL
 for qemu-arm@nongnu.org; Tue, 15 Nov 2022 08:07:07 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.109.156.148])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id 1FA8113ED9BE8;
 Tue, 15 Nov 2022 14:06:58 +0100 (CET)
Received: from kaod.org (37.59.142.98) by DAG4EX2.mxp5.local (172.16.2.32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.16; Tue, 15 Nov
 2022 14:06:58 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-98R002cbd81469-1655-42f4-957a-661fefa1a461,
 4108EF7A520F6C47CD43A20CA0BA38D18DA47D40) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <890395fe-ed58-8a5d-be76-b28d99e6289a@kaod.org>
Date: Tue, 15 Nov 2022 14:06:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH 0/1] hw/arm/aspeed: Automatically zero-extend flash images
Content-Language: en-US
To: Peter Delevoryas <peter@pjd.dev>
CC: <peter.maydell@linaro.org>, <andrew@aj.id.au>, <joel@jms.id.au>,
 <qemu-arm@nongnu.org>, <qemu-devel@nongnu.org>, <patrick@stwcx.xyz>,
 Francisco Iglesias <frasse.iglesias@gmail.com>, Alistair Francis
 <alistair@alistair23.me>
References: <20221114190823.1888691-1-peter@pjd.dev>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20221114190823.1888691-1-peter@pjd.dev>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.98]
X-ClientProxiedBy: DAG5EX2.mxp5.local (172.16.2.42) To DAG4EX2.mxp5.local
 (172.16.2.32)
X-Ovh-Tracer-GUID: 31d21a8d-bd50-4fc8-825d-0e7e28619236
X-Ovh-Tracer-Id: 10300295299853683503
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvgedrgeeggdegkecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfhisehtjeertddtfeejnecuhfhrohhmpeevrogurhhitgcunfgvucfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepuedutdetleegjefhieekgeffkefhleevgfefjeevffejieevgeefhefgtdfgiedtnecukfhppeduvdejrddtrddtrddupdefjedrheelrddugedvrdelkeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomhepoegtlhhgsehkrghougdrohhrgheqpdhnsggprhgtphhtthhopedupdhrtghpthhtohepphgvthgvrhesphhjugdruggvvhdpphgvthgvrhdrmhgrhiguvghllheslhhinhgrrhhordhorhhgpdgrnhgurhgvfiesrghjrdhiugdrrghupdhjohgvlhesjhhmshdrihgurdgruhdpqhgvmhhuqdgrrhhmsehnohhnghhnuhdrohhrghdpqhgvmhhuqdguvghvvghlsehnohhnghhnuhdrohhrghdpphgrthhrihgtkhesshhtfigtgidrgiihiidpfhhrrghsshgvrdhighhlvghsihgrshesghhmrghilhdrtghomhdprghlihhsthgrihhrsegrlhhishhtrghirhdvfedrmhgvpdfovfetjf
 hoshhtpehmohehvdelpdhmohguvgepshhmthhpohhuth
Received-SPF: pass client-ip=46.105.54.81; envelope-from=clg@kaod.org;
 helo=smtpout3.mo529.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: JucF4wMM1dab

Hello Peter,

On 11/14/22 20:08, Peter Delevoryas wrote:
> I've been using this patch for a long time so that I don't have to use
> dd to zero-extend stuff all the time. It's just doing what people are
> doing already, right? I hope it's not controversial.

I simply run :

    truncate --size <size>

on the FW file when needed and it is rare because most FW image builders
know the flash size of the target.

However, the current error message is confusing and the following could
be an improvement :

@@ -1606,6 +1606,13 @@ static void m25p80_realize(SSIPeripheral
      if (s->blk) {
          uint64_t perm = BLK_PERM_CONSISTENT_READ |
                          (blk_supports_write_perm(s->blk) ? BLK_PERM_WRITE : 0);
+
+        if (blk_getlength(s->blk) != s->size) {
+            error_setg(errp, "backend file is too small for flash device %s (%d MB)",
+                       object_class_get_name(OBJECT_CLASS(mc)), s->size >> 20);
+            return;
+        }
+
          ret = blk_set_perm(s->blk, perm, BLK_PERM_ALL, errp);
          if (ret < 0) {
              return;

I can send a patch for the above.


<hack>

I mostly run the QEMU machines with -snapshot, this hack  :

   blk_set_allow_write_beyond_eof(s->blk, true);

makes it work also ...

</hack>


Thanks,

C.

> One note: I couldn't figure out how to make it work without changing the
> permissions on the block device to allow truncation. If somebody knows
> how to avoid the `blk_get_perm`, `blk_set_perm` calls here, let me know!
>
> Thanks,
> Peter
> 
> Peter Delevoryas (1):
>    hw/arm/aspeed: Automatically zero-extend flash images
> 
>   hw/arm/aspeed.c | 40 +++++++++++++++++++++++++++++++++++++++-
>   1 file changed, 39 insertions(+), 1 deletion(-)
> 

