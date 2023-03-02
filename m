Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp8006042ejc;
        Thu, 2 Mar 2023 01:25:44 -0800 (PST)
X-Google-Smtp-Source: AK7set8sPzNZ7WFpkOwu/YT5+j+EsFqrHDB9Nn+WfOVVkyEActBeG4lrI4PD6UOzCDGiRdFRHuKj
X-Received: by 2002:a05:6214:da4:b0:56e:a93e:2300 with SMTP id h4-20020a0562140da400b0056ea93e2300mr19410390qvh.40.1677749144450;
        Thu, 02 Mar 2023 01:25:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677749144; cv=none;
        d=google.com; s=arc-20160816;
        b=ihgi9xBlAbcSrQInatO5BTbnF2BcVt1DoEace0+6SsDuFI7s4xZrnyUBA9XCax8CqF
         9nC5/TSycgIp/tLtZ0b/v051cBqDr1gheyNuqPjy1kqyK5MG1o8hbgVw2ZYkgTAm531L
         R+Fh3QvdjKbTGUPhcBc1tfBzmVHSLMje/+x/bH1Ih48qrHToooJUZtGTxTz9NoUis3Kh
         2mG/M1myCxUtOZ27kzRSENeDRaMi45eJX3pXhe5HGznQN6eMQ1tLt1361NGrR0WLjZNK
         l/n1Z8bjaEa5V/2HeKt3DtSPTW/T6KpgwR8isVuYcrvYJaXBzlzG1uDpuDNNAnDGoToh
         QSZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:dkim-signature;
        bh=UgUMEt+prO6c8gKv0UVNWeB2aWOakOZG0Q9kLxhGLG4=;
        b=bq5kFcHzj6mrPOZEcFgBtIU8p/z83ZN1DFCc0ZgERm0Xq4XNeKEtWlBAVYsPOR6TSI
         hgnAzKI93904Xq936bZ0up6QzcOdlgkuWNciiP0rr10r5caNxsXZYe1NyhmTrBfqWSsI
         9hqDMYMBsEjy+zdML9CWKd8F37sWZRhVuROo2QzVaZ7OnW71JT4s5AdIGfjpmaurkwrG
         Wb77n+tNZOkPvRjhOtpCZMmJHoNzliyBdcyUacnrleHVKnH7dlo/bLsFGxTYq6jZV82f
         dcaiyXbt5Y9jzlgtehNwE5HGxISl4I/j4FGh3IJgRcKXy+msDXjoeysgA9SzCfMBN732
         7o7A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=HyKcX4ZH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j10-20020a0c9cca000000b0056f079ac110si12652891qvf.124.2023.03.02.01.25.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 02 Mar 2023 01:25:44 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=HyKcX4ZH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pXfBy-0000ao-NI; Thu, 02 Mar 2023 04:25:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xadimgnik@gmail.com>)
 id 1pXfBc-0000Cs-SE; Thu, 02 Mar 2023 04:25:17 -0500
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <xadimgnik@gmail.com>)
 id 1pXfBZ-0003K6-SI; Thu, 02 Mar 2023 04:25:15 -0500
Received: by mail-wm1-x32c.google.com with SMTP id
 j19-20020a05600c191300b003eb3e1eb0caso1229906wmq.1; 
 Thu, 02 Mar 2023 01:25:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:from:from:to:cc:subject:date:message-id:reply-to;
 bh=UgUMEt+prO6c8gKv0UVNWeB2aWOakOZG0Q9kLxhGLG4=;
 b=HyKcX4ZHkkLBYAq3Cg96RXW3o4GQXr3Gdhv6X4bin2xWdwTo9fe4px1QtV1jgjLg2p
 NkX1mGSXsHmeaXQqJLJHBiI+WosGNhMt8sLHrBw9u7MAFp1lAq9vlVQ15m5o7bWv6ct5
 222lY4uSauT0/S53otZEO6UY+o1PPBIMievqtNaCA5umyHeO51Q5IRBNX9YHSttqb+lD
 g/fdLkKFSc5i1/ysQ79PR9XX+jwKTOOpzjAS71yppz+Gt/PQfpylJdrflf755r9iUrAZ
 aveN8pvHx5kwAptAxbbxEXi7pvl9sQZVh+jbXzIXurU/Z8Mg80xbYSSo1SdYvpsj7mVe
 rXiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:from:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UgUMEt+prO6c8gKv0UVNWeB2aWOakOZG0Q9kLxhGLG4=;
 b=BicWIUx0yXh6jC9NBTNbPrHqmMGFQu+2yhlzOTgOstN466qbdMJDy0qi5nHrh4K2NB
 ahDolIiOxqAZvJZBjyeorLKV2lParInu8BsMntTsBOWfQNVjhkPKfAg0CksA0GvWphJL
 1OjYR13zg+MEwkEVDM7vPu/F2HlE/45a5u30nzufZZfA+0H5lFp/ip81/biAJpU39Swi
 A+Loy2VCMKReobbZB0nsOMui0OemAyT7bHmMZmvJNhXl9kIIV8Q+kOI7ub9jTCS6raAo
 bNp+Rtb8N9dM3Wth+uaUTd5rZCNqeQ9Ty9HPGE8v3/C3sLLLbvk1xyO4SA0OLtinjsbc
 mE4Q==
X-Gm-Message-State: AO0yUKWjBLQcHpe5xrdR9z2Vpqmvxms5a1TVnKaUUHIUaR2sJ4HIQyKJ
 Vt3VBB3+SU7dL/vUZKIFMIM=
X-Received: by 2002:a05:600c:81e:b0:3e2:201a:5bce with SMTP id
 k30-20020a05600c081e00b003e2201a5bcemr7299439wmp.40.1677749110852; 
 Thu, 02 Mar 2023 01:25:10 -0800 (PST)
Received: from [192.168.18.179] (54-240-197-239.amazon.com. [54.240.197.239])
 by smtp.gmail.com with ESMTPSA id
 h8-20020adff188000000b002c54241b4fesm14573977wro.80.2023.03.02.01.25.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 Mar 2023 01:25:10 -0800 (PST)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: Paul Durrant <paul@xen.org>
Message-ID: <c5ba665d-f385-8ed5-9f4e-acac9b7c6f62@xen.org>
Date: Thu, 2 Mar 2023 09:25:05 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v6 4/4] hw: replace most qemu_bh_new calls with
 qemu_bh_new_guarded
Content-Language: en-US
To: "Michael S. Tsirkin" <mst@redhat.com>, Alexander Bulekov <alxndr@bu.edu>
Cc: qemu-devel@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Mauro Matteo Cascella <mcascell@redhat.com>, Peter Xu <peterx@redhat.com>,
 Jason Wang <jasowang@redhat.com>, David Hildenbrand <david@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Bandan Das <bsd@redhat.com>,
 "Edgar E . Iglesias" <edgar.iglesias@gmail.com>,
 Darren Kenny <darren.kenny@oracle.com>, Bin Meng <bin.meng@windriver.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>, Jon Maloy <jmaloy@redhat.com>,
 Siqi Chen <coc.cyqh@gmail.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Anthony Perard <anthony.perard@citrix.com>, Kevin Wolf <kwolf@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, Amit Shah <amit@kernel.org>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 John Snow <jsnow@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Keith Busch <kbusch@kernel.org>, Klaus Jensen <its@irrelevant.dk>,
 Fam Zheng <fam@euphon.net>, Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>,
 "open list:X86 Xen CPUs" <xen-devel@lists.xenproject.org>,
 "open list:virtio-blk" <qemu-block@nongnu.org>,
 "open list:i.MX31 (kzm)" <qemu-arm@nongnu.org>,
 "open list:Old World (g3beige)" <qemu-ppc@nongnu.org>
References: <20230205040737.3567731-1-alxndr@bu.edu>
 <20230205040737.3567731-5-alxndr@bu.edu>
 <20230301155442-mutt-send-email-mst@kernel.org>
Organization: Xen Project
In-Reply-To: <20230301155442-mutt-send-email-mst@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=xadimgnik@gmail.com; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.09, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-To: paul@xen.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: VKmMAt2+wNkB

On 01/03/2023 20:54, Michael S. Tsirkin wrote:
> On Sat, Feb 04, 2023 at 11:07:37PM -0500, Alexander Bulekov wrote:
>> This protects devices from bh->mmio reentrancy issues.
>>
>> Reviewed-by: Darren Kenny <darren.kenny@oracle.com>
>> Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
>> Signed-off-by: Alexander Bulekov <alxndr@bu.edu>
> 
> Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
> 

Xen parts...

Reviewed-by: Paul Durrant <paul@xen.org>

