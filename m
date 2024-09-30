Received: by 2002:a17:505:70c3:b0:1be9:327d:8ee3 with SMTP id lw3csp1234910njc;
        Mon, 30 Sep 2024 06:29:08 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVtfcrQAGucOeuOA/ntkKSuNnIAjtZ2TkHu/yFqVrjIQNmt9BQh4R+XNwdJ5OUxxIzyyU5bh0Gb/UThMQ==@linaro.org
X-Google-Smtp-Source: AGHT+IHOW657NH+IRE0cz3XWfOBDXlf4WBuXtrDVhgyWWC1niFrxTcbdK1IWrwU2nxGCaTHJJttC
X-Received: by 2002:a05:620a:4606:b0:79f:433:6e7f with SMTP id af79cd13be357-7ae3782e436mr2158993985a.21.1727702948514;
        Mon, 30 Sep 2024 06:29:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1727702948; cv=none;
        d=google.com; s=arc-20240605;
        b=Om0PekvWwVPMIAYn2HHtVEd1jbX2OF6TDfGuYAaby9rGagO2HCPn5Diqvhkdoo1tjq
         nG+TmjfDbUPw8TNEdaRpijktGs3MQpnr8K1w7IQFxy/YFUxpPgMN3k7rDm8HMKNZuQV8
         yRd4VIbX2Y/NI4LUCUupcTbje6KtMSzIpB+EkmfTp72lS7ZeQS2nCg+PWr2T/QlTbII+
         mXQxqzjoHcUGcT5nx00E73g8InHos23Ry7tP1UMhkHorBaEIV+42XmmohP7pO9cOsDRw
         KKS3vtJD2rw1BFyjvKAsxCnrrGHMA69nqjTVWGKtch1eUul2wlBjmVrUPbxgvq6FmI80
         zcaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:content-language:references:cc:to:from:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=+waii4FbayNO7LNajP/96dTGHhFcyMFynIDpkcVFBvg=;
        fh=473fBm433A1Q8N7qMV771k6WBZJ4+bbDdUfHwK8sObY=;
        b=kdw8rM6AqdIFMhMyjWPvxK2fhpODJ3vs+bkZKR+Pg3U0Dus+nvVyRih6bv92cIV7Jc
         GAl5a6VI0aRvAPGtES+a4+bLy2cVuGbrZRHvLDPdj30qNjAqHMSiaQJBN1Ycn9/BAdc/
         PhUWczBZ0haKFkHKX77sMhBB5Js+ueJ2yqtnUqJuOPF1l4T0M+OolO0qBVmpo7V7ugCO
         tL4iKJTZzdtFqILsAORqsmFpYTan5E1eFJ2YYYGa5urz1U108kIitvMZfgEAx7TjoW9C
         7giEZ8DH4aXVHW34gwWnkxNKYvnlV3KgzJvQCWCUny9NRJNilgIfPFTM/rBZNetB7x8K
         ildg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@yandex-team.ru header.s=default header.b=JoRfMGd4;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=yandex-team.ru
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7ae378a06b7si859455185a.761.2024.09.30.06.29.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 30 Sep 2024 06:29:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@yandex-team.ru header.s=default header.b=JoRfMGd4;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=yandex-team.ru
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1svGSJ-00086L-6c; Mon, 30 Sep 2024 09:28:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1svGSG-0007y3-UW; Mon, 30 Sep 2024 09:28:49 -0400
Received: from forwardcorp1b.mail.yandex.net
 ([2a02:6b8:c02:900:1:45:d181:df01])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1svGSC-0001ux-Tc; Mon, 30 Sep 2024 09:28:48 -0400
Received: from mail-nwsmtp-smtp-corp-main-62.myt.yp-c.yandex.net
 (mail-nwsmtp-smtp-corp-main-62.myt.yp-c.yandex.net
 [IPv6:2a02:6b8:c12:1105:0:640:3589:0])
 by forwardcorp1b.mail.yandex.net (Yandex) with ESMTPS id CD99A60D36;
 Mon, 30 Sep 2024 16:28:39 +0300 (MSK)
Received: from [IPV6:2a02:6b8:b081:b737::1:2c] (unknown
 [2a02:6b8:b081:b737::1:2c])
 by mail-nwsmtp-smtp-corp-main-62.myt.yp-c.yandex.net (smtpcorp/Yandex) with
 ESMTPSA id WSZQ8J1Id0U0-LPaVea0W; Mon, 30 Sep 2024 16:28:39 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; t=1727702919;
 bh=+waii4FbayNO7LNajP/96dTGHhFcyMFynIDpkcVFBvg=;
 h=In-Reply-To:Cc:Date:References:To:From:Subject:Message-ID;
 b=JoRfMGd4aPROPyM57tZZgEbu5mfdKA4KSnMElz4iYOSQPOSvA59jhWGflAA4+mzh5
 V+g/a1pylBFmHjJsH84dFnG00YQvkfNzR1qC/8Mo+5Z6lQqSGgRURcWPm9VsuZzeb9
 r+6xZiGhBWgkukWBN16hx9zaSdkiLevDtfaE2J0Q=
Authentication-Results: mail-nwsmtp-smtp-corp-main-62.myt.yp-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Message-ID: <f0d0b7f0-e989-4a83-b33e-6e273f4a2b77@yandex-team.ru>
Date: Mon, 30 Sep 2024 16:28:32 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 03/19] qapi/block-core: Drop temporary 'prefix'
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
Cc: alex.williamson@redhat.com, andrew@codeconstruct.com.au,
 andrew@daynix.com, arei.gonglei@huawei.com, berrange@redhat.com,
 berto@igalia.com, borntraeger@linux.ibm.com, clg@kaod.org, david@redhat.com,
 den@openvz.org, eblake@redhat.com, eduardo@habkost.net,
 farman@linux.ibm.com, farosas@suse.de, hreitz@redhat.com,
 idryomov@gmail.com, iii@linux.ibm.com, jamin_lin@aspeedtech.com,
 jasowang@redhat.com, joel@jms.id.au, jsnow@redhat.com, kwolf@redhat.com,
 leetroy@gmail.com, marcandre.lureau@redhat.com, marcel.apfelbaum@gmail.com,
 michael.roth@amd.com, mst@redhat.com, mtosatti@redhat.com,
 nsg@linux.ibm.com, pasic@linux.ibm.com, pbonzini@redhat.com,
 peter.maydell@linaro.org, peterx@redhat.com, philmd@linaro.org,
 pizhenwei@bytedance.com, pl@dlhnet.de, richard.henderson@linaro.org,
 stefanha@redhat.com, steven_lee@aspeedtech.com, thuth@redhat.com,
 wangyanan55@huawei.com, yuri.benditovich@daynix.com, zhao1.liu@intel.com,
 qemu-block@nongnu.org, qemu-arm@nongnu.org, qemu-s390x@nongnu.org,
 kvm@vger.kernel.org, avihaih@nvidia.com
References: <20240904111836.3273842-1-armbru@redhat.com>
 <20240904111836.3273842-4-armbru@redhat.com>
 <a9b78fc7-c2f6-43ea-b3b4-eab5eb3ed0f3@yandex-team.ru>
Content-Language: en-US
In-Reply-To: <a9b78fc7-c2f6-43ea-b3b4-eab5eb3ed0f3@yandex-team.ru>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Yandex-Filter: 1
Received-SPF: pass client-ip=2a02:6b8:c02:900:1:45:d181:df01;
 envelope-from=vsementsov@yandex-team.ru; helo=forwardcorp1b.mail.yandex.net
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 01/MHwJpN0j2

On 30.09.24 16:23, Vladimir Sementsov-Ogievskiy wrote:
> On 04.09.24 14:18, Markus Armbruster wrote:
>> Recent commit "qapi: Smarter camel_to_upper() to reduce need for
>> 'prefix'" added a temporary 'prefix' to delay changing the generated
>> code.
>>
>> Revert it.  This improves XDbgBlockGraphNodeType's generated
>> enumeration constant prefix from
>> X_DBG_BLOCK_GRAPH_NODE_TYPE_BLOCK_BACKEND to
>> XDBG_BLOCK_GRAPH_NODE_TYPE_BLOCK_BACKEND.
>>
>> Signed-off-by: Markus Armbruster<armbru@redhat.com>
> 
> Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
> 

Oops sorry, I see now that was merged already.

-- 
Best regards,
Vladimir

