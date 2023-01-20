Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp1009355ejc;
        Fri, 20 Jan 2023 03:40:02 -0800 (PST)
X-Google-Smtp-Source: AMrXdXtbR0fkbotZmjJndub09oNY45VOZmSjd+zD1/0CH6YP8MWfBKUB87Lo4urkIDL4Bf6lvqlX
X-Received: by 2002:a05:6214:5905:b0:532:1a83:c8f5 with SMTP id lp5-20020a056214590500b005321a83c8f5mr22449097qvb.47.1674214802798;
        Fri, 20 Jan 2023 03:40:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1674214802; cv=none;
        d=google.com; s=arc-20160816;
        b=g+3Ia3rOWNYfsr3nwKcOgA9o46bCTjbskGiClwcIJr2pCP/XE5iHAH4i/QH2hdry/8
         rd5UT77iFbu3rNTgxiemB4WMuwaXI+Z4ObQQwxzjs2DNC9g+7/1SnFttRc1VbHMcbWht
         2LAZCuJtbBLdDisWhgyK1d+rylnP32xp/LaTSQuK86IHn/bbgQy3n4VaJuDzdzV8oqQz
         rN4ay3BaIHoWJol6CFZhTr0XTmK0rqLoNB1cjXZVZK9WtuZmcBCl2YnmQk96t9NXlQ2w
         LbYkSE074OTyJFaVM8pkvrMFPBOD6C7A2DCmQqq24ap0os6DLitOw5ClvdeFaz5bKfz6
         M7aA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=Ajl2DcMrgtFUAhvmjfmss1MrYMGMO7s7JUUQvhzsUP4=;
        b=NE6CDp2WEVy9l3Tm2hpkVOTB2uDIZ+S6vEA9TWDsa5bqRBT5MFr0KtlRSNNCUCV9NN
         xi0R/G19S3Frj3nWEdrBQZRBw+gdB+t22WwzZxfuzjULogXFvl8mO7h5IO0BRmTFIUX4
         aIiU41pmPx5EuGCafSU38NtwMhxeE7GROxhU+U3FDhIs8Q1Om3ySCv/v8b/9WFFnE+z7
         4wzCEynB/zrCzPQcbk9AsTmqqE6CtUN6UAYDlu8EmJYe6E7SwPF/6WjeDf+0LUmydofP
         8A5+fwctJbGedkPinP51D0vw+Vg9xthl0iJQ/BWshMBK6iJ8PoBHyr5xCQ0l5XUHtyGT
         XHyQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=KHYvPVpt;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t7-20020a0562140c6700b00534b196cae3si11339712qvj.292.2023.01.20.03.40.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 20 Jan 2023 03:40:02 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=KHYvPVpt;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pIpk6-0008Dt-1A; Fri, 20 Jan 2023 06:39:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pIpk3-000873-SY
 for qemu-arm@nongnu.org; Fri, 20 Jan 2023 06:39:31 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pIpk1-0006Oc-1K
 for qemu-arm@nongnu.org; Fri, 20 Jan 2023 06:39:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674214767;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ajl2DcMrgtFUAhvmjfmss1MrYMGMO7s7JUUQvhzsUP4=;
 b=KHYvPVpt56NC8jEP7VWPPX+thbTRen2yls6pxu129wbemhRmfSS15NzRQk9tqaJ+o1JrZK
 hTwe9Z1aAnRGfSC4Nn54SvILTTxbj+4xYz8A2cx4v9hapK6PG01hN7O9gnDhFWB9zlMAG/
 jUT3uGoHk+J6t3znDkjcSshJt7G3aLk=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-248-hmI4sND4Mdq8_rHfirbYwA-1; Fri, 20 Jan 2023 06:39:26 -0500
X-MC-Unique: hmI4sND4Mdq8_rHfirbYwA-1
Received: by mail-qk1-f200.google.com with SMTP id
 br6-20020a05620a460600b007021e1a5c48so3280880qkb.6
 for <qemu-arm@nongnu.org>; Fri, 20 Jan 2023 03:39:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Ajl2DcMrgtFUAhvmjfmss1MrYMGMO7s7JUUQvhzsUP4=;
 b=cgK15WLHL114w96Cytr310aHSyQvJwELOuzo4eQ8JPK8brfqGobtv0ZGmLNApRJnYb
 tAMCVEdZKNB1i7N89/zbfI4DPoE5I7GQLtdNy208kOwB/JdOkGLsT9k6sRWORn4tpo4M
 JyjITd82OhHB3nJn4ChulJON6GgNQ3T32yjUcvos9GWgwMhkjf3lDLwXeVRvZp5uIHqg
 5Cb3jcTyAfucri8b+ZsyzROlEaSz8SbvLEm9rWPMZ7h4KonEUSkP107R+TAKNwmJ49A7
 kNRHDNxdsWce+pPyDFB/TVl4paCqE9sv2817l83Gb+t+9AS6ROKQlSAL4V1iZ0zPDjpL
 cTsw==
X-Gm-Message-State: AFqh2kr17lFTYE3zzoc/jrB3TLW/DqWG29zhL7m82N8dwU+JZTVN5JB1
 wzgESeb9NyzWsmjTSNtqFakTJNqE4b6DzZDZZVsAllBSr2qUsZUXuni48cId90domUNTkx4CjIT
 zQf+WJKHtciFL
X-Received: by 2002:ac8:7208:0:b0:3a6:8da6:65bc with SMTP id
 a8-20020ac87208000000b003a68da665bcmr20353608qtp.13.1674214765942; 
 Fri, 20 Jan 2023 03:39:25 -0800 (PST)
X-Received: by 2002:ac8:7208:0:b0:3a6:8da6:65bc with SMTP id
 a8-20020ac87208000000b003a68da665bcmr20353595qtp.13.1674214765695; 
 Fri, 20 Jan 2023 03:39:25 -0800 (PST)
Received: from [192.168.0.2] (ip-109-43-177-118.web.vodafone.de.
 [109.43.177.118]) by smtp.gmail.com with ESMTPSA id
 x22-20020ac87316000000b003a530a32f67sm8220487qto.65.2023.01.20.03.39.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 20 Jan 2023 03:39:24 -0800 (PST)
Message-ID: <15e767e5-a576-0599-77ed-974d0d412f80@redhat.com>
Date: Fri, 20 Jan 2023 12:39:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [RFC PATCH 6/8] tests/qtest/libqtest: Allow checking for HVF
 accelerator
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Laurent Vivier <lvivier@redhat.com>, 
 Fabiano Rosas <farosas@suse.de>, Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-arm@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, Igor Mammedov <imammedo@redhat.com>
References: <20230119100537.5114-1-philmd@linaro.org>
 <20230119100537.5114-7-philmd@linaro.org>
 <fc7802c3-afd7-2cd0-438e-7b75f4789879@redhat.com>
 <b61a6249-3b84-e0cf-6220-029086c72254@linaro.org>
 <147a979d-2d16-4ad3-4330-3e8187f88a2e@redhat.com>
 <c41c336a-d435-ec2a-ab05-2f50c05645df@redhat.com>
 <7fff2e79-16c6-f49e-476d-53db0ce58474@linaro.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <7fff2e79-16c6-f49e-476d-53db0ce58474@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: 11
X-Spam_score: 1.1
X-Spam_bar: +
X-Spam_report: (1.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.089, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 RCVD_IN_SBL_CSS=3.335, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-TUID: tmZI4anWCmop

On 20/01/2023 12.18, Philippe Mathieu-Daudé wrote:
> On 20/1/23 11:26, Thomas Huth wrote:
>> On 19/01/2023 13.05, Thomas Huth wrote:
>>> On 19/01/2023 12.30, Philippe Mathieu-Daudé wrote:
>>>> On 19/1/23 12:24, Thomas Huth wrote:
>>>>> On 19/01/2023 11.05, Philippe Mathieu-Daudé wrote:
>>>>>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>>>>>> ---
>>>>>> RFC: CONFIG_HVF is poisoned.
>>>>>>
>>>>>> We could pass host config definitions to qtest using:
>>>>>>
>>>>>>    diff --git a/meson.build b/meson.build
>>>>>>    @@ -2547,6 +2547,7 @@ foreach target : target_dirs
>>>>>>
>>>>>>       accel_kconfig = []
>>>>>>       foreach sym: accelerators
>>>>>>    +    config_host_data.set(sym + '_QTEST', '')
>>>>>>         if sym == 'CONFIG_TCG' or target in 
>>>>>> accelerator_targets.get(sym, [])
>>>>>>           config_target += { sym: 'y' }
>>>>>>           config_all += { sym: 'y' }
>>>>>>
>>>>>> Then test for CONFIG_HVF_QTEST ...
>>>>>
>>>>> I don't think that would really work well. The qtests are build once 
>>>>> for all targets, and HVF is only available in the target that matches 
>>>>> the host architecture. It's poisoned on purpose.
>>>>>
>>>>> The TCG accelerator is special, since we have it in either none or in 
>>>>> all targets, that's why we can use CONFIG_TCG there.
>>>>>
>>>>> The kvm part is also rather a hack... we should maybe rather 
>>>>> additionally use the "query-kvm" QAPI command to check whether it is 
>>>>> really available...?
>>>>>
>>>>> To fix this properly for HVF, I think you'd need a way to query the 
>>>>> available accelerators via QMP, too... Hmmm, weren't there some patches 
>>>>> for something like that in the past ... can't remember right now ...
>>>>
>>>> https://lore.kernel.org/qemu-devel/20210505125806.1263441-3-philmd@redhat.com/ 
>>>> :(
>>>
>>> Ah, right, and we ended up with the competing patch from Igor since we 
>>> could not quite settle on the QAPI extensions?
>>>
>>> Hmm, what happens if you execute "query-qmp-schema" on a HVF-enabled host 
>>> these days? Is there a "hvf"-related entry somewhere in the response?
>>
>> Alternative idea: execute QEMU once with "-accel help" via 
>> g_spawn_command_line_sync() or g_spawn_sync() once and look for the 
>> accelerator in the standard output.
> 
> There is no stability guaranty with the help output.

Sure, it's rather meant as a temporary solution until a proper QMP method is 
in place. We also have the advantage here that it is internal to the QEMU 
repository only - it's not like libvirt or some other upper layers are 
trying to parse the output here.

> QMP is a stable API, we should really rely on it here IMO.

I agree, QMP should certainly be the final goal.

  Thomas

