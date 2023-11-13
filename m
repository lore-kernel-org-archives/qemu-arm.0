Received: by 2002:a17:906:5a52:b0:9d0:bf65:29fa with SMTP id my18csp1175177ejc;
        Sun, 12 Nov 2023 23:57:22 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGQjYsYT3aZfb0wLJ81f6yPjFTTxehfehl2Hnencz8aHtkQGfGz7/k0N9CF18wbicNCln0w
X-Received: by 2002:a05:622a:40e:b0:417:95e7:a2f7 with SMTP id n14-20020a05622a040e00b0041795e7a2f7mr7307837qtx.19.1699862242097;
        Sun, 12 Nov 2023 23:57:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1699862242; cv=none;
        d=google.com; s=arc-20160816;
        b=b8j1dn+RZGwNoJFgOspiZXfKgM8WYum971x6o2DQVnI7Rszpfr95BhND3sWCzUUSuN
         RxOffSQsu3jpdT/95rEHIsBIQU67VHs/CtE7QM7c8j8KigfL5ZugiRIRMINzTgW7X68Q
         j6/22FI68yPe+tsjB3DC2AnQiJFxN3+tzT5/G0/mJOVqq63CdTD9KTZoYFO7F8w4/D2U
         S19yGRBZwSBsBcNAimpo6keWEESOeCTCbedC/Rh7CqE6sFpqO4JRqoDCwFBcavvWzmCU
         8Z9sTyk7fUdSTn+na/x+ahoKbG+yas5MCuT+TEQJecULaYh+c3SdRZ9kwtKRYC748LMg
         ZTWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:from:references:to:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=AP9CEFm9pP0lKE6ugBT+KeW8yFRdGUz9Kpgkb9IZGb4=;
        fh=VXDQyyj4wLr5l8mZvyPYOYeNy2VWfiNjg+zmhwbPNTk=;
        b=YwTAG0gMaN/rX9IU0b3eIlsug1Trk/WNiXnibT1EDMhvq3gNRReK4d1F26n1sCzL41
         Z9bMo6kZJokEoX9HCzfWt91UAkrqlWYQq5aMMr02/W9NPSirUX5r69kveVgXlEyoAfFb
         +rWk+UFAosqvB2Vzy4RJPKtbQgCGTiMaMasNlR7zT4gll1nrhyZLN68AUU+NBzsmV5rH
         j3aN9cuu+NXxtIZeipN+7OPxnnOwu9FIDYRo715iidahDVWTIY3N/QZsfa510/xZnx/3
         Rk2Hfs6J1D+gpNQXvCEqOEJY1OBLh4YsasGEYN0A1sJEMc2G79FS+JeHOFNMrBEGtWOn
         VFfQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=DomicGWa;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bp34-20020a05622a1ba200b0041976f260b0si4169706qtb.119.2023.11.12.23.57.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 12 Nov 2023 23:57:22 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=DomicGWa;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1r2Ro3-00073p-PS; Mon, 13 Nov 2023 02:56:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1r2Rnw-00072z-HH
 for qemu-arm@nongnu.org; Mon, 13 Nov 2023 02:56:23 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1r2Rnn-0001vb-Tt
 for qemu-arm@nongnu.org; Mon, 13 Nov 2023 02:56:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1699862170;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AP9CEFm9pP0lKE6ugBT+KeW8yFRdGUz9Kpgkb9IZGb4=;
 b=DomicGWa/LS9MOAF9Xu3oGi6HlATqVxok3oCNfc2s8zAgDvj3NAtnlX37cL9/y0b8S/Seg
 2hdjyRoI1q8DGhCWvXnBYUvoLAxgfwWehz/nIH5i1iwh6VfBcwVXpX3oA+CB4OWbDV5rSg
 XRTMbUwHmuxya4FDoNvVY6YfczOESrI=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-317-Psnbyvh0NQGqpksKimR6iw-1; Mon, 13 Nov 2023 02:56:06 -0500
X-MC-Unique: Psnbyvh0NQGqpksKimR6iw-1
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-779ffb552eeso503053885a.3
 for <qemu-arm@nongnu.org>; Sun, 12 Nov 2023 23:56:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699862166; x=1700466966;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=AP9CEFm9pP0lKE6ugBT+KeW8yFRdGUz9Kpgkb9IZGb4=;
 b=jqMdePijTQi31g6qY1YgVGZCgXyakx17MHfax4iczDuYB/J+LMBGOxHV3dwJzR5+ev
 lsOHpkwvS5U18fD3/GpCsh41JbFJ6936Vtd28GhSOtFkx0dJYV3QPhcMsr+rHzo2/arm
 O7WRp6u2X7RexBp7zYDaEnWLhIfjvfL2ySmx4TlV7JpMRxYHNNsly63J6KzpSCGYOMOc
 ff/x8l2xJHRf5lntj8D/zSps95ofd5/88J+oDJW602cmsBKpSP8JCJJbapW3ybBZUtoF
 dQkH04DnQTQsxhQYGGy8y8KI1ksnrw5wZqNaFLnmwK7UE52duEfsvi2itX4rCfPqJgDb
 nYuQ==
X-Gm-Message-State: AOJu0Yw2O14vgV/AEIwXJ5OyN5hYgAyMSvm2MbwKr8vygpQPwZjzgc8S
 BhfvIEPKvPoN8AxXlqDRgtEJvYj1bcu/oonzXW9FE1J1XBzT/rBehAFthpLYX0jkRPS9xF23iB7
 iu8CSh3C5dLfh
X-Received: by 2002:a05:620a:3d1:b0:778:92d6:db0f with SMTP id
 r17-20020a05620a03d100b0077892d6db0fmr6654184qkm.20.1699862166375; 
 Sun, 12 Nov 2023 23:56:06 -0800 (PST)
X-Received: by 2002:a05:620a:3d1:b0:778:92d6:db0f with SMTP id
 r17-20020a05620a03d100b0077892d6db0fmr6654176qkm.20.1699862166106; 
 Sun, 12 Nov 2023 23:56:06 -0800 (PST)
Received: from ?IPV6:2a01:e0a:280:24f0:9db0:474c:ff43:9f5c?
 ([2a01:e0a:280:24f0:9db0:474c:ff43:9f5c])
 by smtp.gmail.com with ESMTPSA id
 x20-20020a05620a0b5400b0077bda014d8esm1341552qkg.87.2023.11.12.23.56.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 12 Nov 2023 23:56:05 -0800 (PST)
Message-ID: <69f9d31c-893c-492c-aea3-1f0af4f52962@redhat.com>
Date: Mon, 13 Nov 2023 08:56:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-8.2] test-resv-mem: Fix CID 1523911
To: Thomas Huth <thuth@redhat.com>, Eric Auger <eric.auger@redhat.com>,
 eric.auger.pro@gmail.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 peter.maydell@linaro.org, "Michael S. Tsirkin" <mst@redhat.com>
References: <20231110083654.277345-1-eric.auger@redhat.com>
 <b92285b4-156b-4a39-baba-ffc2e80e21bf@redhat.com>
From: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@redhat.com>
In-Reply-To: <b92285b4-156b-4a39-baba-ffc2e80e21bf@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=clg@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: HDmks2g4Bt35

On 11/13/23 08:21, Thomas Huth wrote:
> On 10/11/2023 09.36, Eric Auger wrote:
>> Coverity complains about passing "&expected" to "run_range_inverse_array",
>> which dereferences null "expected". I guess the problem is that the
>> compare_ranges() loop dereferences 'e' without testing it. However the
>> loop condition is based on 'ranges' which is garanteed to have
>> the same length as 'expected' given the g_assert_cmpint() just
>> before the loop. So the code looks safe to me.
>>
>> Nevertheless adding a test on expected before the loop to get rid of the
>> warning.
>>
>> Fixes: CID 1523901
>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>> Reported-by: Coverity (CID 1523901)
>>
>> ---
>>
>> Hope this fixes the Coverity warning as I cannot test.
>> ---
>>   tests/unit/test-resv-mem.c | 4 ++++
>>   1 file changed, 4 insertions(+)
>>
>> diff --git a/tests/unit/test-resv-mem.c b/tests/unit/test-resv-mem.c
>> index 5963274e2c..cd8f7318cc 100644
>> --- a/tests/unit/test-resv-mem.c
>> +++ b/tests/unit/test-resv-mem.c
>> @@ -44,6 +44,10 @@ static void compare_ranges(const char *prefix, GList *ranges,
>>       print_ranges("out", ranges);
>>       print_ranges("expected", expected);
>>   #endif
>> +    if (!expected) {
>> +        g_assert_true(!ranges);
>> +        return;
>> +    }
>>       g_assert_cmpint(g_list_length(ranges), ==, g_list_length(expected));
>>       for (l = ranges, e = expected; l ; l = l->next, e = e->next) {
>>           Range *r = (Range *)l->data;
> 
> Reviewed-by: Thomas Huth <thuth@redhat.com>
> 
> I'll queue it (unless somebody else wants to take this?).

There is also another fix for the same series :

   https://lore.kernel.org/qemu-devel/20231109170715.259520-1-eric.auger@redhat.com/

I was waiting to have a little more for VFIO to queue both but
they could go through your queue also.

Thanks,

C.


