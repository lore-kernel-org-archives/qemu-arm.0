Received: by 2002:a17:906:6698:b0:a28:f940:7a27 with SMTP id z24csp2025101ejo;
        Sun, 7 Jan 2024 17:24:46 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFaxQs8/r54RL6HhZnHanIVE7MJ7Lbfr43nhHNHbMvPvNoE8RSE/DQ2m6RJdF2DHWcuSSML
X-Received: by 2002:ac8:5a49:0:b0:429:8e79:9aa6 with SMTP id o9-20020ac85a49000000b004298e799aa6mr1206450qta.46.1704677085801;
        Sun, 07 Jan 2024 17:24:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1704677085; cv=none;
        d=google.com; s=arc-20160816;
        b=yimltGFmyi5u+RO/xteFJMltSl9WBtBtCMZnHMPCcGn3a6EtwWWci3VG8++x+8H8ef
         aMLQa1wUassagKoDKBWrkQXK5l4SmuhWtzIy1sMHuJxLTMTZuu7E0MvQtibyf7Tz9e5m
         K+KVTqJy5B8152B09d+bNTocvOJwejslsZDOCwFls5gy6w0BxMvDYwxgWq823ObHvlTK
         lxvv1RJqYuZbYp6YtrM6R/u2SP3MrQPwRnucrHJ85gVWlc6YHUFJ/RRH2L7gWXydlC8f
         9DCziTCn7r16BpDYBOTSPeFGQjKRLr7b22Pi9WOXuy5JgxBiSt+Q2wMUipSrfBWgDRHP
         wy2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=zR4HYJF5zMqs/5iCnmncn7xcU4rl6McY+Iy07koCy9c=;
        fh=jw4YmxRTxWIj3tB8I57VrE1SSRXEGIUlVhBIqxt0pYU=;
        b=BnFWLB6BmMP8eV+OD6JfAsxhH8gVsgNITCVdlhk9M6jMOT8Qg8zrR8MfMDfvuD7kLG
         hODC47oqOSxwPw2QSqqEcAa1mFeVuDhjSDvLvnMv0JsMpPuPqiNkpT2n+lisCOLB8Wpa
         oyxguSGEdG2zJKJwX5Ne+5GFRzhhAA5VpNzImO8VlJTv4fOu33W3+DuHobX7mUls5gIh
         4JInY5Z/XXq9i1g1UkiKBuuK5f6ocaGbmwbvDvdYErxDt/XVPZ8JPAy+3dDwFcm+qy+Z
         wYdTszbdjgz03rLlCkt1jcrEAnlxpDUHuSSnfFTmt+7BmvcRXdTGDI3cyHH4JwppyYNG
         tWTA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=JEXlOoYX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 13-20020ac8570d000000b0042996e55447si904629qtw.379.2024.01.07.17.24.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 07 Jan 2024 17:24:45 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=JEXlOoYX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rMeNZ-0008Ah-O5; Sun, 07 Jan 2024 20:24:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1rMeNX-00089o-T2
 for qemu-arm@nongnu.org; Sun, 07 Jan 2024 20:24:35 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1rMeNV-0000Nn-Vx
 for qemu-arm@nongnu.org; Sun, 07 Jan 2024 20:24:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1704677073;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zR4HYJF5zMqs/5iCnmncn7xcU4rl6McY+Iy07koCy9c=;
 b=JEXlOoYXh4vmfZICcGkUpQfGmv6wFn05+d6WnmmEn1/QDm40TaSdJzGU9mW6hhYNOlrc1N
 vxpzlpRQtFBfIXTegbcVCJz/0eVYo6iokDKRtng+rkSgj2BvuMoz2dRoFQVgiWtTfKrd4K
 EGHPirU5vHoBvyhaYqeVIy6CsAAghlg=
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com
 [209.85.210.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-36-7OcR9PAYMa2YR2LwR6FjgQ-1; Sun, 07 Jan 2024 20:24:31 -0500
X-MC-Unique: 7OcR9PAYMa2YR2LwR6FjgQ-1
Received: by mail-pf1-f200.google.com with SMTP id
 d2e1a72fcca58-6d9b050e9a8so1890561b3a.1
 for <qemu-arm@nongnu.org>; Sun, 07 Jan 2024 17:24:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704677070; x=1705281870;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=zR4HYJF5zMqs/5iCnmncn7xcU4rl6McY+Iy07koCy9c=;
 b=M9XzA4G87mY1oCZBv0yOMzKnwhdpZ7eD5DWTL+Fm9ZZNHb7m1lRif3PvipohW3hwAN
 5j5tBHKb1NwF0vQhFg8jRY197DaUiIm1H8ezuh28kUVRRjBubhWyg6ZQiTICxOKJ49do
 QIdvrejSj1//ISgbHqdWghAcJc8YrwbRVhPaoE+WpwERAfkwnaf85RjZvVz154Szh0Gs
 n+5M3vBFxh121w4tt5U29+4eHSn6y9YukcNG/PtJjIYVhqlz63juvLlP3Z3DcM4bvINA
 z41XtmqeGx+GmVH8qP+HMJD7768bLMaXiZacdjZQtwQDo1rJ6yLsdAk2W12dLfaPSCGH
 oAAQ==
X-Gm-Message-State: AOJu0YyQdcSMJM6FI/IeEI+K8MO7BX55c9KhBX8nfki3gNwfdErd0NrI
 vajv07EItPgSdcXDVWVgWDe699idhkMEAp674pVpgexPRsz3gRHQNfyic0dfEkMBRWQf0V/7tC2
 qExmzUXIzOe2dNQNjN902
X-Received: by 2002:a05:6a00:11de:b0:6d9:bbac:a34b with SMTP id
 a30-20020a056a0011de00b006d9bbaca34bmr2759506pfu.14.1704677070618; 
 Sun, 07 Jan 2024 17:24:30 -0800 (PST)
X-Received: by 2002:a05:6a00:11de:b0:6d9:bbac:a34b with SMTP id
 a30-20020a056a0011de00b006d9bbaca34bmr2759496pfu.14.1704677070346; 
 Sun, 07 Jan 2024 17:24:30 -0800 (PST)
Received: from [10.72.112.108] ([43.228.180.230])
 by smtp.gmail.com with ESMTPSA id
 l2-20020a056a00140200b006d9aa4b65fasm4955573pfu.98.2024.01.07.17.24.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 07 Jan 2024 17:24:29 -0800 (PST)
Message-ID: <37c885a5-d67d-443c-8059-8f23f909adf5@redhat.com>
Date: Mon, 8 Jan 2024 11:24:18 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 0/9] Unified CPU type check
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, peter.maydell@linaro.org,
 b.galvani@gmail.com, strahinja.p.jankovic@gmail.com, imammedo@redhat.com,
 kfting@nuvoton.com, wuhaotsh@google.com, nieklinnenbank@gmail.com,
 rad@semihalf.com, quic_llindhol@quicinc.com, marcin.juszkiewicz@linaro.org,
 eduardo@habkost.net, marcel.apfelbaum@gmail.com, armbru@redhat.com,
 wangyanan55@huawei.com, vijai@behindbytes.com, palmer@dabbelt.com,
 alistair.francis@wdc.com, bin.meng@windriver.com, liwei1518@gmail.com,
 dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com, shan.gavin@gmail.com
References: <20231204004726.483558-1-gshan@redhat.com>
 <0b2aaedf-7a4c-49f4-b4af-71f9ab693207@redhat.com>
 <ff0237a8-9e1c-46bf-ae69-99c3f33112f6@linaro.org>
 <23213dcb-16ca-4be4-9ff2-32e4fc491495@redhat.com>
 <2ddfcd43-b5db-4f87-922b-0d2d5dd27d77@linaro.org>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <2ddfcd43-b5db-4f87-922b-0d2d5dd27d77@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-2.098,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: q9ptKlK1MlL6

Hi Phil,

On 1/6/24 08:12, Philippe Mathieu-Daudé wrote:
> On 13/12/23 11:54, Gavin Shan wrote:
>> On 12/13/23 20:08, Philippe Mathieu-Daudé wrote:
>>> On 12/12/23 05:55, Gavin Shan wrote:
>>>> On 12/4/23 10:47, Gavin Shan wrote:
>>>>> This series bases on Phil's repository because the prepatory commits
>>>>> have been queued to the branch.
>>>>>
>>>>>    https://gitlab.com/philmd/qemu.git (branch: cpus-next)
>>>>>
>>>>> There are two places where the user specified CPU type is checked to see
>>>>> if it's supported or allowed by the board: machine_run_board_init() and
>>>>> mc->init(). We don't have to maintain two duplicate sets of logic. This
>>>>> series intends to move the check to machine_run_board_init() so that we
>>>>> have unified CPU type check.
>>>>>
>>>>> This series can be checked out from:
>>>>>
>>>>>    git@github.com:gwshan/qemu.git (branch: kvm/cpu-type)
>>>>>
>>>>> PATCH[1-4] refactors and improves the logic to validate CPU type in
>>>>>             machine_run_board_init()
>>>>> PATCH[5-9] validates the CPU type in machine_run_board_init() for the
>>>>>             individual boards
>>>>>
>>>>> v6: https://lists.nongnu.org/archive/html/qemu-arm/2023-11/msg00768.html
>>>>> v7: https://lists.nongnu.org/archive/html/qemu-arm/2023-11/msg01045.html
>>>>> v8: https://lists.nongnu.org/archive/html/qemu-arm/2023-11/msg01168.html
>>>>>
>>>>
>>>> Ping to see if there is a chance to queue it up before the Chrismas? :)
>>>
>>> Series queued. "Before" Christmas will depend on the final release tag.
>>>
>>> Thanks for the various iterations,
>>>
>>
>> Phil, thank you for you continuous reviews and valuable comments.
>>
>> Yes, the final merge to master branch depends on the release plan.
>> 'queue' meant to merge the series to your 'cpus-next' branch ;-)
> 
> I had to fix 3 different issues caught by our CI. Next time please
> run your series on GitLab CI, you just have to push your branch and
> wait for the result :)
> 
> Now merged as 445946f4dd..cd75cc6337.
> 
> Happy new year!
> 

Happy new year. I just came back from holiday.

Thanks for the reminder for GitLab CI, which I don't know how to run yet.
I will learn how to run it from gitlab :)

Thanks,
Gavin

