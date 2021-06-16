Received: by 2002:a19:f807:0:0:0:0:0 with SMTP id a7csp669138lff;
        Wed, 16 Jun 2021 13:06:48 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJytB8LoY76PV3abB4r9gnx9DVKic75sxh24xtijIQ1m7zifYuydMZHlH2xBpGOS2bhUe9+w
X-Received: by 2002:a05:600c:a45:: with SMTP id c5mr781210wmq.153.1623874008724;
        Wed, 16 Jun 2021 13:06:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1623874008; cv=none;
        d=google.com; s=arc-20160816;
        b=nG8GykqC5hAuuvxGU1amu14Ae61RBqghU5kW0paUxoO5/EDuPgyN/zMRUgmgcax6Ie
         mAydDBK42sxZTZtV7Lm5zh5TIsVo5vpNTL1bv5UUUeDDqp34B/vic9/qyJQDzCy8Srs0
         +6ODxXopgUoNlYtSiRr8DnHWtlyLhduqe1DOY0csUFd3J9kAOGHIiUhOhO41zIjQt9ox
         zJoEhttJIj9hGBBG198SnhCs1mTWjmqqNTVVgLhiR0euqkhZZJUNRt+qPCnyyzx2hKOu
         4XlI+ZNZrT8fh2jJgyR7aT+Vx6LxVZMighYT3mVxZ/PmEZqtPYJHMLyyjcdDrX2F79lk
         ewZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:references
         :message-id:in-reply-to:subject:to:from:date;
        bh=S61elWUM9PLj57TpnaeHuih6+oIHpdscyHw6MnNcKV0=;
        b=WddafYe8pp1BKJqsqf42+OFR2AZgwmxfICXe/PFyNVKeR4IIRasXwWhAH4xGiDB76v
         axILw79H6HnQWuXSCvjiHNhMRXoBmGXBvigh1XMN1FUhfuQq+24FVSs3iXFZfyOeEgxE
         rclNjs144GTQy72cpain81sHSYbOYFi0/61nzynY23UrR5NGEnN13ETWtoWNJGjQJ5Nm
         qocTUYZVy7oK+c7Vav+oJjnA/grdWE4cxcUO/rGqKQSJ4rhFf6T4jX6wjQzFZryO9V6Z
         XraFAF8xrsYXoWhqUv8ee6kF2Qf1gRnXOBk07vqWRinOgrY8UI+IwrEBvtFnbHQ6v6CJ
         w74A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=eik.bme.hu
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r67si2286887wma.19.2021.06.16.13.06.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 16 Jun 2021 13:06:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=eik.bme.hu
Received: from localhost ([::1]:36954 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ltboF-0003eo-OU
	for alex.bennee@linaro.org; Wed, 16 Jun 2021 16:06:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40350)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1ltbo2-0003eY-5J; Wed, 16 Jun 2021 16:06:34 -0400
Received: from zero.eik.bme.hu ([152.66.115.2]:59053)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1ltbnz-0000xd-Hq; Wed, 16 Jun 2021 16:06:33 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 7E15974570B;
 Wed, 16 Jun 2021 22:06:27 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 51B957456E3; Wed, 16 Jun 2021 22:06:27 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 4CB727456B4;
 Wed, 16 Jun 2021 22:06:27 +0200 (CEST)
Date: Wed, 16 Jun 2021 22:06:27 +0200 (CEST)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <f4bug@amsat.org>
Subject: Re: [PATCH v3 10/13] hw/misc/auxbus: Replace i2c_send_recv() by
 i2c_recv() & i2c_send()
In-Reply-To: <cad0abfc-da54-1ac5-74e6-882251c70465@amsat.org>
Message-ID: <edfa6c2-b157-53cd-c083-8cd01e489e8@eik.bme.hu>
References: <20210616161418.2514095-1-f4bug@amsat.org>
 <20210616161418.2514095-11-f4bug@amsat.org>
 <0a45d89a-b710-12f7-6f82-75fdc6f0384d@linaro.org>
 <cad0abfc-da54-1ac5-74e6-882251c70465@amsat.org>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="3866299591-1997640944-1623873987=:48693"
X-Spam-Probability: 9%
Received-SPF: pass client-ip=152.66.115.2; envelope-from=balaton@eik.bme.hu;
 helo=zero.eik.bme.hu
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Corey Minyard <cminyard@mvista.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 "Signed-off-by : Frederic Konrad" <frederic.konrad@adacore.com>,
 qemu-arm@nongnu.org, qemu-ppc@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 5atG4w6CpIxv

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--3866299591-1997640944-1623873987=:48693
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8BIT

On Wed, 16 Jun 2021, Philippe Mathieu-Daudé wrote:
> On 6/16/21 8:46 PM, Richard Henderson wrote:
>> On 6/16/21 9:14 AM, Philippe Mathieu-Daudé wrote:
>>> @@ -161,12 +157,11 @@ AUXReply aux_request(AUXBus *bus, AUXCommand
>>> cmd, uint32_t address,
>>>           }
>>>             ret = AUX_I2C_ACK;
>>> -        while (len > 0) {
>>> -            if (i2c_send_recv(i2c_bus, data++, true) < 0) {
>>> +        for (i = 0; i < len; i++) {
>>> +            if (i2c_send(i2c_bus, data[i]) < 0) {
>>>                   ret = AUX_I2C_NACK;
>>>                   break;
>>>               }
>>> -            len--;
>>>           }
>>
>> This form of updating ret is better than...
>>
>>> @@ -200,14 +195,13 @@ AUXReply aux_request(AUXBus *bus, AUXCommand
>>> cmd, uint32_t address,
>>>             bus->last_transaction = cmd;
>>>           bus->last_i2c_address = address;
>>> -        while (len > 0) {
>>> -            if (i2c_send_recv(i2c_bus, data++, true) < 0) {
>>> +        for (i = 0; i < len; i++) {
>>> +            if (i2c_send(i2c_bus, data[i]) < 0) {
>>>                   i2c_end_transfer(i2c_bus);
>>>                   break;
>>>               }
>>> -            len--;
>>>           }
>>> -        if (len == 0) {
>>> +        if (i == len) {
>>>               ret = AUX_I2C_ACK;
>>>           }
>>
>> ... this one.
>
> I totally agree :) I was a bit ashamed for posting that, I thought
> Zoltan would prefer less changes so used this form.
> Will update on respin.

It's not the number of changes that matters but if there's any change in 
behaviour. If you can make it clearer that there's no change in behaviour 
by making more changes then that's OK.

Regards,
BALATON Zoltan

>> Otherwise,
>> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
>
> Thanks!
>
>
--3866299591-1997640944-1623873987=:48693--
