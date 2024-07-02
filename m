Received: by 2002:a17:504:7599:b0:1be7:c013:c773 with SMTP id j25csp1961220njm;
        Tue, 2 Jul 2024 06:21:05 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWyai4NApPDkmAJYdUJRak5c0cJkU9aZ8rAmBDZIO9j81HF/c+ESATgfjrYKUsMfoqOiKtH3+qgW3g++3KCzq34arlLmYF4
X-Google-Smtp-Source: AGHT+IGrKEtHxMseajwa1+7X+47xamahUUrxpeHYVy5YjfgmZ73W8LuL19Ca+xDGbqik5ZUINpId
X-Received: by 2002:a05:620a:2729:b0:795:4823:a3d3 with SMTP id af79cd13be357-79d7b9b0e4cmr1340235385a.10.1719926465002;
        Tue, 02 Jul 2024 06:21:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1719926464; cv=none;
        d=google.com; s=arc-20160816;
        b=wMhMkDKmq1N03jwCekJVTxgqG3cSH+jpkS9sdezf5/Zk0fCWXH2T7uhpwZRfLS/Tr2
         2pDvm86Ed11hvupKw6XGtp2NcPhObObjMS/u+NubqKoGRKpecmnECF/o5AWnbfwoitBV
         Zzyt0piHYQGk1vJpUVSvVRkzAKWij3QNLLHRBdACt74Jg8OhgS+7XDp5EJ5lNXLyEzih
         j08ncxyPd9JNIvrGcYDrO7qAVvLEYNA33BCalkH1FTB/fwttR93VObW1cA0DrJjcID72
         bvOU/ZWxzx2fOj1nyJ7cGCqbnL/SI8WrrW84mLGPNbQPIj4lZTTP+Y2YcnlBnH3dxs2E
         x3jQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:to:references:content-language:subject:from:user-agent
         :mime-version:date:message-id;
        bh=fuDa57aAT8wfhHe9QqGHubgSjKDKTtFKJCvSNVJVars=;
        fh=DBwo5oYV+Zl89FPcGyBzo6mnqwnGCoM6YpiQGc4/RNc=;
        b=KUONwfP80xn4eFpES3ErH7mOF2q7Cy0rTttHTPQSOHrO/IFvrHzixdS2Hyo+KTqxNj
         uY3gFjA5AQAijiHRdV5oc8jycm7ccZo/bA+lw7CnWFE6pBgaB8j8Qz55O/7pclqZJc+9
         xFmyRwX72OpGmxkhnst/0oXDtBIEbILv6ANFOTaeIY0SAiikqBMKbc0PZcMdT+v6bJuN
         OjdDy1QbNS6z2vPWjNSfHwJVOjsb1bYxeDBx1cQvnZemLTpmczsPVE3sAmzwC6UNEGNZ
         zG9ujSy7ezkZQ0dNLhRgMLSjQ/5//jhOJXLmpIbfe2x1I4TfNroxZitFWlnx82P1HUFH
         BMkQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-79d692f1cd6si1003516685a.239.2024.07.02.06.21.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 02 Jul 2024 06:21:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sOdRJ-0006Vu-UX; Tue, 02 Jul 2024 09:20:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qianfeifan@iie.ac.cn>)
 id 1sOZ3i-0006jZ-TL
 for qemu-arm@nongnu.org; Tue, 02 Jul 2024 04:40:18 -0400
Received: from smtp84.cstnet.cn ([159.226.251.84] helo=cstnet.cn)
 by eggs.gnu.org with esmtps (TLS1.2:DHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <qianfeifan@iie.ac.cn>)
 id 1sOZ3g-0001JY-85
 for qemu-arm@nongnu.org; Tue, 02 Jul 2024 04:40:18 -0400
Received: from [192.168.119.142] (unknown [159.226.94.118])
 by APP-05 (Coremail) with SMTP id zQCowAAnLubhvINmq_AfAQ--.61977S3;
 Tue, 02 Jul 2024 16:40:02 +0800 (CST)
Message-ID: <5a58c464-feda-46b6-8fe0-09a8ab526e47@iie.ac.cn>
Date: Tue, 2 Jul 2024 16:39:13 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: =?UTF-8?B?6ZKx6Z2e5Yeh?= <qianfeifan@iie.ac.cn>
Subject: Asking about the Fault Handling of GPFs in Arm CCA
Content-Language: en-US
References: <f8d8fec3-cbd0-445b-8aa7-3646e0848782@iie.ac.cn>
To: qemu-arm@nongnu.org
In-Reply-To: <f8d8fec3-cbd0-445b-8aa7-3646e0848782@iie.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: zQCowAAnLubhvINmq_AfAQ--.61977S3
X-Coremail-Antispam: 1UD129KBjvdXoW7XFW3ZF47urW7tw43JFW3trb_yoWfCFb_Zr
 sYq39rZ3yrZrW3Jw43tFsIyF10grsYgry8Gryvvr13t343Aws7JrZavrZ3Cr4ag398AFy5
 ZFnxXay3Crya9jkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUIcSsGvfJTRUUUbzkYjsxI4VWkCwAYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I
 6I8E6xAIw20EY4v20xvaj40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM2
 8CjxkF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVW8JVW5JwA2z4x0Y4vE2Ix0
 cI8IcVCY1x0267AKxVW8JVWxJwA2z4x0Y4vEx4A2jsIE14v26F4UJVW0owA2z4x0Y4vEx4
 A2jsIEc7CjxVAFwI0_GcCE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IE
 w4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_JrI_JrylYx0Ex4A2jsIE14v26r4j6F4UMc
 vjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwCY02Avz4vE14v_GFyl42xK82IYc2Ij
 64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x
 8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1j6r15MIIYrxkI7VAKI48JMIIF0xvE
 2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42
 xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF
 7I0E14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x07j2WlgUUUUU=
X-Originating-IP: [159.226.94.118]
X-CM-SenderInfo: htld0wphlit0o6llvhldfou0/1tbiBwsGCWaDop5tQgAAs1
Received-SPF: pass client-ip=159.226.251.84; envelope-from=qianfeifan@iie.ac.cn;
 helo=cstnet.cn
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Tue, 02 Jul 2024 09:20:56 -0400
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
X-TUID: BzJ5Kc20YQl+

Dear experts,

     I have been learning the Fault Handling of the Granule Protection 
Fault in Arm CCA. I noticed in `target/arm/tcg/tlb_helper.c` that a new 
function, `report_as_gpc_exception`, was introduced in last year's 
commit. If `fi->gpcf == GPCF_Fail`, the return value is the checking 
result of whether GPF bit in SCR_EL3 is set and whether the current_el 
is 3. So if the GPF bit is set, then all GPFs should be pass to EL3 to 
handle.

     However, upon examining the code in QEMU, I was unable to locate 
any related information in EL3's code (TrustedFirmware-A or ATF). Nor 
could I find any demo code to test this Arm CCA feature. This has led me 
to wonder: is this patch solely a QEMU-side patch, with other components 
yet to catch up?

     I would greatly appreciate any guidance or advice you could provide 
to help me test this patch or understand this feature better.

Sincerely,

Feifan Qian

