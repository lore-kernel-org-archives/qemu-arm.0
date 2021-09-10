Received: by 2002:a19:5205:0:0:0:0:0 with SMTP id m5csp743172lfb;
        Thu, 9 Sep 2021 19:40:59 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwPTNlm0njvWQp6g+tP6hX03YQu50HWRSsFBgCDMIdH86gLMptkTTL3LL5EVzobhkW9nd/N
X-Received: by 2002:a6b:f819:: with SMTP id o25mr5160313ioh.21.1631241659805;
        Thu, 09 Sep 2021 19:40:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1631241659; cv=none;
        d=google.com; s=arc-20160816;
        b=BFJNceJFaOGaUQA+s6NCDhu03qWlFqUkESuYffPuCH4u5qv+XXJrltcHVK12JOs3Bh
         VB2Elj7rsy/Fi652a1NJKI/+gZjYf8C/wWoOLhqRjPqRoF+9Za3WAzhff6brFyrJU9Ex
         4iL1eXi05kHGlgh4qmEtFWndVzIBN1Nr80OJjNeQrYYoNs48YWHGTb5quLUEjyS2dRNV
         ggpTN7cQnUuuqwz+zplFKO8qe7jNXqM4yq4UaRW0U7PFiCrKfj11jwsLVOd+W3YJQ94M
         0h/RFsb5NsE8OkSoQd3XcAGqb6Ra5DeBjeaW7Kw/kaZ/UhFgXjPLneTN3dFmVipG8Wlt
         N3xA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:mime-version:user-agent:date:message-id:subject
         :from:to;
        bh=EsJXJjGwfWEEvEskCzrvJ7gncO6Em9qjqFrN/S/PRkc=;
        b=FJqweqoFfB+TvWYl88LjkMVCdqZHrzx06NWsAK+E6q0lWSbLQU+Hdr27SHfYTt+Bub
         dY16fUxme9Rpl70rGVSVRcd/Yeqd4CnbUNOKE+Kym3bB4oB/M3wKHLzfoaBpnj3jZnVx
         DCdbwurSL06WvW5PIzgThzrJU4KQIx5XL9SAjzPmxVItThBsnCfl5HR/IwC7TxLbERWQ
         pwU/5ztgZQzh/9aWDbZG2CqY3Yg0tEfBfU6+tBaii1Z5n6F7KSW27x9RucdAym41lell
         Jpmt/OuK6ZnV39K37+632ozF0rOGXBsZCl68mqCa235ZmODDdN/MbC+c3MsewkUx+xuS
         TDHQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=huawei.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k17si4044933iow.29.2021.09.09.19.40.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 09 Sep 2021 19:40:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=huawei.com
Received: from localhost ([::1]:39658 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mOWTL-0000Eu-6Z
	for alex.bennee@linaro.org; Thu, 09 Sep 2021 22:40:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45370)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangjingyi11@huawei.com>)
 id 1mOWTB-0000EK-Pw; Thu, 09 Sep 2021 22:40:49 -0400
Received: from szxga01-in.huawei.com ([45.249.212.187]:2922)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangjingyi11@huawei.com>)
 id 1mOWT9-0007EV-63; Thu, 09 Sep 2021 22:40:49 -0400
Received: from dggemv703-chm.china.huawei.com (unknown [172.30.72.54])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4H5Kkk3Gglzbm9t;
 Fri, 10 Sep 2021 10:36:30 +0800 (CST)
Received: from kwepemm600020.china.huawei.com (7.193.23.147) by
 dggemv703-chm.china.huawei.com (10.3.19.46) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.8; Fri, 10 Sep 2021 10:40:32 +0800
Received: from [10.174.187.192] (10.174.187.192) by
 kwepemm600020.china.huawei.com (7.193.23.147) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.8; Fri, 10 Sep 2021 10:40:31 +0800
To: <peter.maydell@linaro.org>, <qemu-devel@nongnu.org>
From: Jingyi Wang <wangjingyi11@huawei.com>
Subject: Questions on setting guest CPU models with ARM kvm enabled
Message-ID: <440b72ca-01f2-337a-ad00-fd2d73ae4ea7@huawei.com>
Date: Fri, 10 Sep 2021 10:40:30 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.187.192]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 kwepemm600020.china.huawei.com (7.193.23.147)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.187;
 envelope-from=wangjingyi11@huawei.com; helo=szxga01-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: pbonzini@redhat.com, Andrew Jones <drjones@redhat.com>, qemu-arm@nongnu.org,
 "wanghaibin.wang@huawei.com" <wanghaibin.wang@huawei.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: pgp3o8eiycpP

Hi all,
     On ARM hardware, as qemu docs describes, "Named CPU models generally
do not work with KVM." May I ask what is the main obstacle to setting a
guest CPU model on later host hardware?

     For example, if I want to start Cortex-A57 guest on Cortex-A72 host,
I noticed that there is not much big difference between these two CPU
models(Please correct me if I'm wrong), what work should I do?


Thanks,
Jingyi
