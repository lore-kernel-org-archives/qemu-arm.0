Received: by 2002:a17:906:fcb7:b0:974:3dd3:6e73 with SMTP id qw23csp3898829ejb;
        Tue, 6 Jun 2023 20:22:26 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4ix9EbLxtnqy/0X0yMEy2i/gcz/Z3NsgrBfK9rFMzcf3p6204cKzR94XTpOu8RPQllFYCm
X-Received: by 2002:a05:620a:4449:b0:75b:23a1:3688 with SMTP id w9-20020a05620a444900b0075b23a13688mr818330qkp.73.1686108146390;
        Tue, 06 Jun 2023 20:22:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1686108146; cv=none;
        d=google.com; s=arc-20160816;
        b=mcQ+WfS/c+TMH9/RhRCCOSz8ocgMkp8x9n8GUl4rIFAs5R3OLWNiSQw/6AhhTm4fpa
         r/harwnt4kE6UCkp6nJKi79ch+3YitQ9LXqMtv0TbtW6uucH2uVmMkYrfx5fcC18cUKj
         QfmUt/w8JwvYRkyMgAp2c8ahOwDNMR2XgyOp3TnB2ot9KkXlm7gTF3hJN6aHbmmdOFgV
         IvMcrtT/DMswm2NCFbtzvO/RGb6QjzIJayjy5eW52k2y0kDTHrx9DgPT8i/jblK2zY/H
         RzKobb9BfR4wBkGlrhvp1FnW1ayr2U53Bf4IU7CYZUtfWv4RuEdaanLuuT7Z35W9kNeU
         Rbpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :message-id:mime-version:references:subject:cc:to:from:date;
        bh=NsKSBWp5pUH7vtwipunTO45UCrC8KqXdwmYe9oHWKa8=;
        b=VLUtNtZ3vxgwEnxOj8SRw8STGHC6gpvkilRZhm0/vKRNM7Vx/dVUuffn/v0wJ4AbB8
         7GuOAW1fNXAtkz+wnjHhRz5aqbNo5fzpnKDCaL347oi/+nhNl58aGQGI6LAaKTBVSIRY
         I6VC+lL4tzM/70qKtmhGuWU1NJhXBgXlk6Ko3zzXknKchD6aS47NhIDox5N9xyClNao3
         TrCBpoXMaaOUjtjt2dW4MsDywuoHK7IFcj4Fstuk5eNKEOzG5zDKVdSymUwifH/KeXqL
         NhLmK2YvJSp8d6eD+edMVezZQd8YERhFJ4Gwt19SNIdDU2wH89hKT3Pboac1iGfb0sf/
         cSOg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a9-20020a05620a102900b0074de91d7505si810388qkk.207.2023.06.06.20.22.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 06 Jun 2023 20:22:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q6jk8-0000tq-8i; Tue, 06 Jun 2023 23:21:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyuquan1236@phytium.com.cn>)
 id 1q6jk7-0000tY-57; Tue, 06 Jun 2023 23:21:51 -0400
Received: from zg8tmtyylji0my4xnjqumte4.icoremail.net ([162.243.164.118])
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <wangyuquan1236@phytium.com.cn>)
 id 1q6jjz-0007ik-U7; Tue, 06 Jun 2023 23:21:50 -0400
Received: from prodtpl.icoremail.net (unknown [10.12.1.20])
 by hzbj-icmmx-6 (Coremail) with SMTP id AQAAfwDHkNbE+H9knkjfAQ--.55912S2;
 Wed, 07 Jun 2023 11:25:56 +0800 (CST)
Received: from WYQ-S (unknown [218.76.62.144])
 by mail (Coremail) with SMTP id AQAAfwAHNU2s939k50IAAA--.2733S3;
 Wed, 07 Jun 2023 11:21:17 +0800 (CST)
Date: Wed, 7 Jun 2023 11:21:17 +0800
From: "wangyuquan1236@phytium.com.cn" <wangyuquan1236@phytium.com.cn>
To: wangyuquan1236 <wangyuquan1236@phytium.com.cn>, rad <rad@semihalf.com>, 
 peter.maydell <peter.maydell@linaro.org>, pbonzini <pbonzini@redhat.com>
Cc: marcin.juszkiewicz <marcin.juszkiewicz@linaro.org>, 
 quic_llindhol <quic_llindhol@quicinc.com>, 
 chenbaozi <chenbaozi@phytium.com.cn>, qemu-arm <qemu-arm@nongnu.org>, 
 qemu-devel <qemu-devel@nongnu.org>
Subject: Re: [PATCH v4 0/1] use XHCI to replace EHCI
References: <20230607023314.192439-1-wangyuquan1236@phytium.com.cn>
X-Priority: 3
X-GUID: 72381A2D-4D80-4819-B290-9A261595E5C9
X-Has-Attach: no
X-Mailer: Foxmail 7.2.25.228[cn]
Mime-Version: 1.0
Message-ID: <202306071117462603910@phytium.com.cn>
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64
X-CM-TRANSID: AQAAfwAHNU2s939k50IAAA--.2733S3
X-CM-SenderInfo: 5zdqw5pxtxt0arstlqxsk13x1xpou0fpof0/1tbiAQADAWR-hSkBTgADs4
Authentication-Results: hzbj-icmmx-6; spf=neutral smtp.mail=wangyuquan
 1236@phytium.com.cn;
X-Coremail-Antispam: 1Uk129KBjvdXoW5Kw4xtF4kur4UKFyUXFy3XFb_yoWxWwb_W3
 y0vas7Wrs2yay29FykAF4Fvr9xtr4jkr10gw1IvrWUZr17CFn8Xr15Kr95Zr15WFWUWFyF
 vFWxCrWfWr13WjkaLaAFLSUrUUUUbb8apTn2vfkv8UJUUUU8wcxFpf9Il3svdxBIdaVrnU
 Uv73VFW2AGmfu7jjvjm3AaLaJ3UjIYCTnIWjDUYxBIdaVFxhVjvjDU0xZFpf9x0zRUUUUU
 UUUU=
Received-SPF: pass client-ip=162.243.164.118;
 envelope-from=wangyuquan1236@phytium.com.cn;
 helo=zg8tmtyylji0my4xnjqumte4.icoremail.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: UmnrkVi1PSCh

T24gV2VkLCA3IEp1biAyMDIzIDEwOjMzOjEzICswODAwLCBZdXF1YW4gV2FuZyB3cm90ZToKCgoK
PgoKCgo+IFBsZWFzZSByZXZpZXcgdGhlIGNoYW5nZS4KCgoKPsKgIC0gc2JzYS1yZWY6IFJlcGxh
Y2UgRUhDSSB3aXRoIFhIQ0kgb24gc3lzYnVzLgoKCgo+IFRoaXMgdmVyc2lvbiB1cGRhdGVzIHJl
bGV2YW50IEtjb25maWcgYW5kIHNic2EucnN0IGZpbGUuCgoKCj4KCgoKPiBZdXF1YW4gV2FuZyAo
MSk6CgoKCj7CoMKgIGh3L2FybS9zYnNhLXJlZjogdXNlIFhIQ0kgdG8gcmVwbGFjZSBFSENJCgoK
Cj4KCgoKPsKgIGRvY3Mvc3lzdGVtL2FybS9zYnNhLnJzdCB8wqAgMiArLQoKCgo+wqAgaHcvYXJt
L0tjb25maWfCoMKgwqDCoMKgwqDCoMKgwqDCoCB8wqAgMiArLQoKCgo+wqAgaHcvYXJtL3Nic2Et
cmVmLmPCoMKgwqDCoMKgwqDCoCB8IDIxICsrKysrKysrKysrKy0tLS0tLS0tLQoKCgo+wqAgMyBm
aWxlcyBjaGFuZ2VkLCAxNCBpbnNlcnRpb25zKCspLCAxMSBkZWxldGlvbnMoLSkKCgoKPgoKCgo+
IC0tCgoKCj4gMi4zNC4xCgoKCgoKQmVsb3cgaXMgdGhlIGxpbmsgb2YgY29ycmVzcG9uZGluZyBl
ZGsyIGZpcm13YXJlIHBhdGNoc2V0CgoKCmZvciBxZW11IHNpZGUgdGVzdGluZzoKCgoKaHR0cHM6
Ly9lZGsyLmdyb3Vwcy5pby9nL2RldmVsL21lc3NhZ2UvMTA1NzI2CgoKCgoKTWFueSB0aGFua3MK
CgoKWXVxdWFuCgoKCgo=

