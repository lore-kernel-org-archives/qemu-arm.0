Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp334567lfg;
        Thu, 11 Mar 2021 06:27:53 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzKl8gEx8SVbv5U+MH19lD92mCwb73I4JcEtww1RxL1wcI0JSz+jwz1kWnUU6umvJe4MB1A
X-Received: by 2002:a5d:9b18:: with SMTP id y24mr6436470ion.24.1615472873272;
        Thu, 11 Mar 2021 06:27:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1615472873; cv=none;
        d=google.com; s=arc-20160816;
        b=UAecy1jJeOttIA62gR5twkDdq+2yZIXuDSFDJsU2zgT6ZQgAK3GEnPJY4++YPBzDwQ
         /ekvlRVBq8+A99FGjTD4eP5jQ6/JBulVyd8TDPTbk+7if3MASFCrMepxTHRRV2SJ5Rw9
         XfxbFAcGVeF9Uswgih7+rEBAbGxv9X9yndOxOD9HooCifWW9YLEqxUYlqU8csA/p6j0G
         Xmq04y1tBLvbKwF+PBeYwklsJsK7A+4JCDXy2cKO4bRx26sEIN47zd9sqCqKSUEyj+tO
         hCJiDBtxSUEBMrWfhFYbyNKbaZdM8VQsmxwumcEYduTEA/S5DXkIMN+fZSUTnOtrObiE
         TTfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:mime-version:user-agent:date:message-id:subject
         :from:to;
        bh=DW+0fu1A3moA+iOD03ER0reuvc0A7TvvUYgytTBRNlI=;
        b=zR+DCGT7jjRB1YHOzYTa+pj2bp+af+3JfWjQ8d+5SF7CbpBH/mCoKk0PIEA2K7qhN8
         sA21S+j6sMCn7w3w5Fl9fpHpTbcIaWupbO0RDbbjg5duw9ftfUJP3CzNWKi4YYKR9iKO
         x7ElRAsXmdeYEywGC1aL/edOLqZpSXapAuLutIuV25Zg+3jhjnpz2jlQxTToj9L1u9db
         JaAaVbKEnYlREt+5IMFG/FekvWn7jFOj6LAWM+o8+HoHphvufTDJ42IvyZko/1cR5PNr
         EwvV80/cV3Ux8Tr2IrUYtr8tNPByVHcTzG8eVfu3zGDVI1DerjQenRWbkMvEnDSztsWu
         p5cA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x3si2528302ilj.150.2021.03.11.06.27.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 11 Mar 2021 06:27:53 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:35692 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lKMI4-0008LD-Kd
	for alex.bennee@linaro.org; Thu, 11 Mar 2021 09:27:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35982)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>)
 id 1lKMHw-0008KS-Lu; Thu, 11 Mar 2021 09:27:44 -0500
Received: from mx2.suse.de ([195.135.220.15]:39826)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>)
 id 1lKMHv-0007Eq-4e; Thu, 11 Mar 2021 09:27:44 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 038F0AC16;
 Thu, 11 Mar 2021 14:27:40 +0000 (UTC)
To: Peter Maydell <peter.maydell@linaro.org>
From: Claudio Fontana <cfontana@suse.de>
Subject: arm: "max" CPU class hierarchy changes possible?
Message-ID: <11e9d3bb-c94c-4ad7-35b0-b698376c5e00@suse.de>
Date: Thu, 11 Mar 2021 15:27:39 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=195.135.220.15; envelope-from=cfontana@suse.de;
 helo=mx2.suse.de
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>, qemu-arm@nongnu.org,
 qemu-devel <qemu-devel@nongnu.org>, Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: N71WmbOVM0aL

Hi Peter,

the "max" cpu in x86 and s390 is a class,

and then "host" has "max" as parent.

This would be a convenient setup for ARM too, as it would allow to put common code between kvm and tcg in the "max" class,
and allow "host" to specialize the behavior for KVM (and in the future HVF probably).

Would changing the class hierarchy this way be acceptable, cause any problems?

I ask specifically because on the x86 side I had to limit my changes to the hierarchy to adding objects,
but I would not change the relationship between them.

Thanks,

Claudio

-- 
Claudio Fontana
Engineering Manager Virtualization, SUSE Labs Core

SUSE Software Solutions Italy Srl
