Received: by 2002:a17:906:a84b:b0:7c1:2a22:dc39 with SMTP id dx11csp4111023ejb;
        Mon, 19 Dec 2022 23:15:04 -0800 (PST)
X-Google-Smtp-Source: AMrXdXuvLJbhB8HPo85V63hxMjsHdP+GHOKOQO8Kl2Lkf/As9nBVtrP3m1UU0BsS4ntzteixT6Q0
X-Received: by 2002:a05:622a:5c17:b0:3a8:2dba:751e with SMTP id gd23-20020a05622a5c1700b003a82dba751emr2154088qtb.26.1671520504046;
        Mon, 19 Dec 2022 23:15:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1671520504; cv=none;
        d=google.com; s=arc-20160816;
        b=BNpy86T4uwn0o5S3rXF6fEp2PMUXKYSHBRNMlns0AhoKg/UQsar2zGx8y12ORtPdS3
         swKGaFpAqAN60gcUfdID660khMpMYPRkx0x/aY6/5OzPyDhPUDNjXhxmP+gtJ6zPd7Ho
         3oppOtO3pP5rThdZCjsnF9B0lbrY6cpX8ygvmoidWClazJsEPIZeCujRY2fH6b91pHv8
         ZB/n07/WNAuf8Mpuelx6JrroYTHVwxhFS6kiIBy8o8KVR6vwP0DmdpFXjOAYr9FQguJ5
         YfYNj5Zi9qzSahdnhN9ZsDV6qrnVItf6nidsLnuc3Nt+NfT3JlW4xDP1PTRbmUIpyVOo
         pRPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:references:cc:to:subject;
        bh=lAVng4p9xo6yfyPaOWO1XRZEYyAfzs7QKlNsaqGFH/c=;
        b=lHBKerWt2sCvJ/SPVVAhKynyHqHqJouylDqSrNb6S3cKBzIs/pIWAeTp1wJAhCm3P4
         UamQKhqUZpNN/GzyFm+dzkLli44Wf81FjcNGxEin3ih6/qmWGFSKQBNXCR9gx6CYHZVO
         juqp9gOalFiwU1zwvCDTi+vZwfnxNVe9HJHkG0lSRYYi7f0alhgD16ik1PAFSc22uhdy
         gvs7hsoWaaaGCQjrYfCYmI1YGFc2+e0JIxSb8tEkuhAllPH93bb8DS+0xTm5osChjfnx
         PH//Ss2iAkMBwooCh5pNO8yLSmAI138ggOKs6fRqItCkjCuuZjj7OjNhee11WXOCMJKg
         KDJQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id he8-20020a05622a600800b003a7f3ea9b98si4729621qtb.680.2022.12.19.23.15.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 19 Dec 2022 23:15:04 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1p7Wpg-0002fj-Q5; Tue, 20 Dec 2022 02:14:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yuzenghui@huawei.com>)
 id 1p7Wpa-0002d7-Ru; Tue, 20 Dec 2022 02:14:31 -0500
Received: from szxga02-in.huawei.com ([45.249.212.188])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yuzenghui@huawei.com>)
 id 1p7WpY-00042f-0A; Tue, 20 Dec 2022 02:14:30 -0500
Received: from kwepemm600007.china.huawei.com (unknown [172.30.72.54])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4Nbnpv5R5szJqRQ;
 Tue, 20 Dec 2022 15:13:11 +0800 (CST)
Received: from [10.174.185.179] (10.174.185.179) by
 kwepemm600007.china.huawei.com (7.193.23.208) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.34; Tue, 20 Dec 2022 15:14:10 +0800
Subject: Re: [PATCH] hvf: arm: Add support for GICv3
To: Alexander Graf <agraf@csgraf.de>
CC: <qemu-devel@nongnu.org>, Peter Maydell <peter.maydell@linaro.org>,
 <qemu-arm@nongnu.org>
References: <20221219220808.26392-1-agraf@csgraf.de>
Message-ID: <d848e536-94ba-7f2e-ad40-026449fa63fd@huawei.com>
Date: Tue, 20 Dec 2022 15:14:09 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20221219220808.26392-1-agraf@csgraf.de>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.185.179]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 kwepemm600007.china.huawei.com (7.193.23.208)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.188; envelope-from=yuzenghui@huawei.com;
 helo=szxga02-in.huawei.com
X-Spam_score_int: -52
X-Spam_score: -5.3
X-Spam_bar: -----
X-Spam_report: (-5.3 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.149,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
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
Reply-to:  Zenghui Yu <yuzenghui@huawei.com>
From:  Zenghui Yu via <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: tEIdj9X9U7oI

On 2022/12/20 6:08, Alexander Graf wrote:
> We currently only support GICv2 emulation.

Before looking into it, I think it's worth finalizing the GIC version in
the hvf case - only v2 is allowed and fail early if user selects the
unsupported versions. Currently finalize_gic_version() does not deal
with hvf at all.
