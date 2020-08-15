Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp1495281lfy;
        Sat, 15 Aug 2020 11:10:05 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy8TkJJZTEkiJMKF/0oMVfw0EX4VJXjhJ8I+7CCya7QiYe58v4Rt/WI0CEQBdcIuYyi7EbM
X-Received: by 2002:a25:e016:: with SMTP id x22mr11529352ybg.9.1597515005540;
        Sat, 15 Aug 2020 11:10:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1597515005; cv=none;
        d=google.com; s=arc-20160816;
        b=0kvmWIsZ6xM83w10cMndaciKP/1tnaol+JI5xmfnpsCZyT1wXgEXjmNu+jd/37/HQL
         un0qIB9Z4FLiqiVvyyyO+O+yS2Fn8cxIuHTJsiFkmJV551eB3kvhwM6lmpoEoB3H17UO
         mA6fCuG37Q2fXWG6RpUTEX5o9oUPZGQTyb0zVpHMLKGMvqOc4+gzu+702QSnBL5s1xrE
         zLUqkk2K7jZ+frYBnxICSrWDeNywsmWEjNitg0+q/8ofjcB/Iu9b9ENkv03rofKWYajR
         622EJ9Q97T7Dgq5KS1gLv01p9L+UUMKCdVdln2xKCMeqXJm9ljMhZSQorfS319/uu5PB
         Wwgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject;
        bh=HRI5hdek6dsiL6IesS2eO8ZIQCShzsuKafci0vLkLHU=;
        b=B2PWeOF/13PtnjFt8pyk6DYgcPjlbQ9wNN8QiZwAFt/RKRiZuyoObdpmcfJnr0ixvc
         l60ovq8SaYTIIL+wEc8+ngsFTR3i2XAxwRnmsBrUM4Ujr4zSlYhbwiSy2iQLZ1yzjeaQ
         Xdnnw/hBkjzgyqj9+JghmVhrRMi8GxBJAEl6SIwIpBpIaIwrEiJUqsaxvcAxS99in7ni
         qSNDwdZcm3ksADKOhahSlPirS7LpgQgHeMmZylqanWpIwRUkCFEbh8m0OMKMpY9Wxyx6
         anNbn2zXOKou8vKHnh4XgngxHRIOlzgwSJhKDDlm8RIcB5YEfztec/jo+i8HC2B0GfLq
         vPAQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j63si11834130ybb.47.2020.08.15.11.10.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 15 Aug 2020 11:10:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:52978 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1k70d2-00031X-PL
	for alex.bennee@linaro.org; Sat, 15 Aug 2020 14:10:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53308)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liangpeng10@huawei.com>)
 id 1k70cd-00030b-Fm; Sat, 15 Aug 2020 14:09:40 -0400
Received: from szxga08-in.huawei.com ([45.249.212.255]:59442 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liangpeng10@huawei.com>)
 id 1k70cb-00080c-Om; Sat, 15 Aug 2020 14:09:39 -0400
Received: from DGGEMM405-HUB.china.huawei.com (unknown [172.30.72.54])
 by Forcepoint Email with ESMTP id 20F75C090A9C964E416E;
 Sat, 15 Aug 2020 10:19:15 +0800 (CST)
Received: from dggema765-chm.china.huawei.com (10.1.198.207) by
 DGGEMM405-HUB.china.huawei.com (10.3.20.213) with Microsoft SMTP Server (TLS)
 id 14.3.487.0; Sat, 15 Aug 2020 10:19:14 +0800
Received: from [10.174.185.187] (10.174.185.187) by
 dggema765-chm.china.huawei.com (10.1.198.207) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1913.5; Sat, 15 Aug 2020 10:19:13 +0800
Subject: Re: [RFC 2/9] target/arm: parse cpu feature related options
To: Andrew Jones <drjones@redhat.com>
References: <20200813102657.2588720-1-liangpeng10@huawei.com>
 <20200813102657.2588720-3-liangpeng10@huawei.com>
 <20200813122113.3esshhhnolqpe6ok@kamzik.brq.redhat.com>
From: Peng Liang <liangpeng10@huawei.com>
Message-ID: <047ab475-8735-c684-b0cb-4f44d93b4a0b@huawei.com>
Date: Sat, 15 Aug 2020 10:19:12 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.1.1
MIME-Version: 1.0
In-Reply-To: <20200813122113.3esshhhnolqpe6ok@kamzik.brq.redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.185.187]
X-ClientProxiedBy: dggeme706-chm.china.huawei.com (10.1.199.102) To
 dggema765-chm.china.huawei.com (10.1.198.207)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.255;
 envelope-from=liangpeng10@huawei.com; helo=huawei.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/15 13:32:32
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: peter.maydell@linaro.org, Zhanghailiang <zhang.zhanghailiang@huawei.com>,
 mst@redhat.com, cohuck@redhat.com, qemu-devel@nongnu.org,
 xiexiangyou 00584000 <xiexiangyou@huawei.com>, qemu-arm@nongnu.org,
 pbonzini@redhat.com, zhukeqian 00502301 <zhukeqian1@huawei.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 510PN3EKUmIB

On 8/13/2020 8:21 PM, Andrew Jones wrote:
> On Thu, Aug 13, 2020 at 06:26:50PM +0800, Peng Liang wrote:
>> The implementation of CPUClass::parse_features only supports CPU
>> features in "feature=value" format.  However, libvirt maybe send us a
>> CPU feature string in "+feature/-feature" format. 
> 
> Why would libvirt do that? If we have a boolean feature, then I'd think
> libvirt should be capable of sending feature=on/off just as easily as a
> +/-feature. Indeed libvirt seems to do the right thing with all the
> CPU features we already have: pmu, sve*, ...
> 
> Thanks,
> drew
> 
> .
> 

Libvirt before d47db7b16dd5422c7e487c8c8ee5b181a2f9cd66 ("qemu: command:
Support new cpu feature argument syntax") will send +/-feature.  Does QEMU
need to support it?  If not, I'll remote it.

Thanks,
Peng
