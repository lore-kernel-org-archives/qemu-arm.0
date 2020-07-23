Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp1334238lfm;
        Wed, 22 Jul 2020 21:29:22 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxanP5WxuTIJPREaaDps1LMiSeOqSIFdndtcBlQE/sTOSMqIfJhZRjLjO5pqCEAUUNaERQ4
X-Received: by 2002:a25:b948:: with SMTP id s8mr3908569ybm.487.1595478562162;
        Wed, 22 Jul 2020 21:29:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1595478562; cv=none;
        d=google.com; s=arc-20160816;
        b=1DdarKdnO/jXbL7dvI2A/aafRK82GwmTCx6Z3sqqDRjjZP9q/FewAN+FqPz7PgNslu
         w4GoKmjLOdYm8P4qZbPFxqAY51xduzRPMr9ujxgKloLPfK8BsdGLeDc93pIUlzgQioa2
         PrJ2KVTZACp2FDAyCjJsppKudYqtBXMRfB3bd+LW9TQZXMQmhKU6g5A9kEOSGCydd2Ti
         up6g5H2S4YErmFwZoZ+lYAWa5fadKmQpi6iXhgf0k5g/jZCX3BoZbSS9QGAVacbnuq6U
         tcXgkuGoM2tP4jqOgtEmqUjSs4Pd3/9OD/AhoDZ0NYv4fQUhgqHDx2swbqEOmxDrj5Lg
         4ZRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:openpgp:from:references:to:subject:dkim-signature;
        bh=YBtCT7tjh0zPKpEU2/5tUc+XuEKUoO5QEsuVGoI7H9A=;
        b=XCVtHA0jQE1+QVP1IhrJa4mQBmEFn10/GYp4QsFLgnclRSTOgBZPctjrLMW4H2TBgi
         4GVFLeWJg7n8a521WICFaOobH9KKkYioC1qRHtHyb0Dwbaggru8czgj3fX1xj7a2PDr1
         cx9lAarQ4Vqi2XGSncoJLRx2Sr63xSBncxN1BpDy+mxVy8NK8cHEH9PXTpriE87j/Rfu
         j/gZLIxjC/GSoz/lsWKTfnhO8t28sxWO0Zi6wRUHesqF6P2GxB4lk29LtH2SIfTzhuWv
         zN7EYQUCU7blfptnsrIV9XCPG0yO1Mc/V8RXze5wtcAKzEi+tEovGyQTx0DMKoQI+7Tx
         N0Sw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=W95w8WLa;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 127si1503512ybb.482.2020.07.22.21.29.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 22 Jul 2020 21:29:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=W95w8WLa;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:46552 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jySrB-0000V7-Id
	for alex.bennee@linaro.org; Thu, 23 Jul 2020 00:29:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57294)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1jySqx-0000Ui-46
 for qemu-arm@nongnu.org; Thu, 23 Jul 2020 00:29:08 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:48990
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1jySqt-0000e2-Nf
 for qemu-arm@nongnu.org; Thu, 23 Jul 2020 00:29:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1595478542;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:openpgp:openpgp;
 bh=YBtCT7tjh0zPKpEU2/5tUc+XuEKUoO5QEsuVGoI7H9A=;
 b=W95w8WLaySzSgxSglMZCaLptw7OH7yxMg8TyLw/w7ITDmO+Sn4V/d7Rj3NNvhjHP7u/ZNa
 n3eeFwNMbTDjpDUiJ7FlJ7AFyyPjtraDFaTbNg8kxJcKp2R11mg63YngqrG/MK/qTXcGJo
 WrMuK7e3HPBquf9xugifhQksAX1NOJQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-356-f_qe4ZZvMNet4YncTh1_rw-1; Thu, 23 Jul 2020 00:28:57 -0400
X-MC-Unique: f_qe4ZZvMNet4YncTh1_rw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BB80018C63E6;
 Thu, 23 Jul 2020 04:28:56 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-87.ams2.redhat.com [10.36.112.87])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 36DD271D13;
 Thu, 23 Jul 2020 04:28:52 +0000 (UTC)
Subject: Re: [PATCH for-5.1] hw: Only compile the usb-dwc2 controller if it is
 really needed
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20200722154719.10130-1-thuth@redhat.com>
 <d77052d1-6203-d54a-0c36-edfafaa34922@amsat.org>
From: Thomas Huth <thuth@redhat.com>
Openpgp: preference=signencrypt
Message-ID: <1aa53dfa-92a0-3866-2117-a7ce450d278f@redhat.com>
Date: Thu, 23 Jul 2020 06:28:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <d77052d1-6203-d54a-0c36-edfafaa34922@amsat.org>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.120; envelope-from=thuth@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/22 22:23:06
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, URIBL_BLOCKED=0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-arm@nongnu.org, Paul Zimmerman <pauldzim@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: r3+rSeAyvXUY

On 22/07/2020 19.23, Philippe Mathieu-Daudé wrote:
> On 7/22/20 5:47 PM, Thomas Huth wrote:
>> The USB_DWC2 switch is currently "default y", so it is included in all
>> qemu-system-* builds, even if it is not needed. Even worse, it does a
>> "select USB", so USB devices are now showing up as available on targets
>> that do not support USB at all. This sysbus device should only be
>> included by the boards that need it, i.e. by the Raspi machines.
> 
> Paul already sent that patch (your description is better although):
> https://www.mail-archive.com/qemu-devel@nongnu.org/msg723681.html

Oh, thanks for the pointer, I should have checked my qemu-devel folder
first... Please disregard my patch!

 Thomas

