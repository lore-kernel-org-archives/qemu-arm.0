Received: by 2002:a19:ef07:0:0:0:0:0 with SMTP id n7csp297863lfh;
        Wed, 18 May 2022 02:56:57 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy5ol4NewVPDkdrfyGYa/gds4lBnf0T420G2ANVvyVNbWKXO1uylkj+GYETrZ9Cpcd/egLw
X-Received: by 2002:a05:620a:46a2:b0:6a0:3f59:e012 with SMTP id bq34-20020a05620a46a200b006a03f59e012mr18983657qkb.452.1652867817167;
        Wed, 18 May 2022 02:56:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1652867817; cv=none;
        d=google.com; s=arc-20160816;
        b=NSzxwTJIDl5x0z4vcyIuItpnxAaBVH/+SPOVJLJu3yd9rzzuHapHi2yO1zwlb/vNOC
         vgDolMEmqawBbRXWIwhk8gtjZ6o36JqE/srF2J4+vLSkvCd38/2+tNGeum5ozjFn38sc
         0kL8KvL6Se+ERaRmidgP7X+uMbsTbwqSmDVcQxSoL0DbeDF6clBwracUnqqACwSP6M7p
         4geyF0YNvH3rE16TrZfycz9UutEaUbDhqzD0GWYaPjdzGLZJV39jd3mGWQGBzrb6RRSF
         uOi/LEVdA9O863dZ1y+SuvHCmk1LtGA6FbEr8/WoGYgf3W7cb6a8TdjlCCtIXejEE3j/
         8Djg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=from:reply-to:sender:errors-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:content-language:mime-version:user-agent
         :date:message-id:cc:to:subject;
        bh=JOyO1bwXhupDEdN/uySik6Cp33SGUNCsJfIjGnlS178=;
        b=I4oCwd3QurNnLY9sqIdqYVtWmQTWSLIdMnrsjZOb8pYzDrr8C3jeD6yNTgAVv3iUWj
         pnLpwWJeu8ShrCl8BzrIiQvrGgmWai7FdW300A5cUS1DOYv94NJ6QluTFtoM/8cb3bHD
         fkNGIeJ7YJ5VCeMKXVKmbA5ZJ+Ya04nlmwScDzDn1Ef7HkxPJjl4PExIDi2yqBAoXf4R
         AvU18zIT02TBAZg6+i3ZLBFDvzTLCW2Qefjdvq3s32z1kgAibOlDBAcd3ZrVO9LVuX7D
         Hgw+XOtQ/oNnh/PYo0EpulI5hjcGnPgbMfVKJcRsWCOYBLSVmG8HGoI5EYoBmqvD8YfE
         zpUA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x21-20020a05620a0ed500b0069fb6de1483si795913qkm.420.2022.05.18.02.56.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 18 May 2022 02:56:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1]:52236 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nrGQK-0000us-Kv
	for alex.bennee@linaro.org; Wed, 18 May 2022 05:56:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35780)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhangxinhao1@huawei.com>)
 id 1nrGPq-0000tD-VY; Wed, 18 May 2022 05:56:28 -0400
Received: from szxga02-in.huawei.com ([45.249.212.188]:6081)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhangxinhao1@huawei.com>)
 id 1nrGPl-0004GL-Jo; Wed, 18 May 2022 05:56:26 -0400
Received: from dggpeml500025.china.huawei.com (unknown [172.30.72.57])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4L37b91DmbzQk9d;
 Wed, 18 May 2022 17:53:09 +0800 (CST)
Received: from [10.174.187.250] (10.174.187.250) by
 dggpeml500025.china.huawei.com (7.185.36.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Wed, 18 May 2022 17:56:03 +0800
Subject: Question about commit 1adf528ec3bd ("hw/rtc/pl031: Send RTC_CHANGE
 QMP event")
To: <eric.auger@redhat.com>, <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
CC: <wanghaibin.wang@huawei.com>
Message-ID: <876a4b1f-a5ca-6bdc-28a8-682a64661f4c@huawei.com>
Date: Wed, 18 May 2022 17:55:46 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.3
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.187.250]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 dggpeml500025.china.huawei.com (7.185.36.35)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.188;
 envelope-from=zhangxinhao1@huawei.com; helo=szxga02-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Reply-to:  jokenzhang <zhangxinhao1@huawei.com>
From:  jokenzhang via <qemu-arm@nongnu.org>
X-TUID: 3Vf0LRUIqemB

Hi Eric,

Have you ever tested the value reported by the PL031 RTC_CHANGE when
the qemu clock is using the virtual clock, which is not identical to
mc146818.

For instance, adding 20s to the guest RTC value, the expected value should be
20, but the actual value is 1652863291:

{"timestamp": {"seconds": 1652863355, "microseconds": 298846}, "event": "RTC_CHANGE", "data": {"offset":
1652863291}}

This is tested with qemu option "-rtc base=utc,clock=vm"

>         s->tick_offset += value - pl031_get_count(s);
>+
>+        qemu_get_timedate(&tm, s->tick_offset);
>+        qapi_event_send_rtc_change(qemu_timedate_diff(&tm));

It may be caused by the calculation of the new reference time. The new reference
time is calculated with s->tick_offset and rtc_ref_start_datetime, and
s->tick_offset is initialized with rtc_ref_start_datetime, resulting that the
rtc_ref_start_datetime is double counting.


Thanks
