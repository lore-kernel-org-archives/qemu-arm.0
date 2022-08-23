Received: by 2002:a17:906:9c0a:0:0:0:0 with SMTP id ff10csp1747498ejc;
        Tue, 23 Aug 2022 14:45:53 -0700 (PDT)
X-Google-Smtp-Source: AA6agR5QS1IBAHR8p51uS/ej68qYRnyjwTZ8JaODpx2HUYdFaLcwDFcAZAj2/+1kxtwthsvqGO6g
X-Received: by 2002:a05:6214:27ee:b0:496:f17b:7459 with SMTP id jt14-20020a05621427ee00b00496f17b7459mr7765072qvb.101.1661291152941;
        Tue, 23 Aug 2022 14:45:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1661291152; cv=none;
        d=google.com; s=arc-20160816;
        b=cJat00A1DtoNxha7tOqC3GPQ9hd4YI1p2J9vVQwGk0r+l6HVFJEgFU5nujM5DY89Eu
         bvv8UY4fu0c8MN090xWzdkaJ3rl9duCoQa9dCa72et4gm8OOe7OvyGdsamkOxxZGYmvc
         Tr0HFZ5vVihRk1/Hzf1im7hg6qe1dKNY/Iw3oFnedmVo7Ykp66VAnk7fD5e4lJYuckV3
         w1jdgg+bHD5gk5T350BMIShvpe/gHydL2P9ds/OLTt8V/jJwWYbsNphYZLuAMNIcck2d
         GBvtd+KhWbqXt6akVq/i0OTVXqobWINVPfpXOpV6ucNoUj9bk6LsXnB6ATBXrQTiiW0k
         Jc1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=7OgYArpRBizpVHjGzyad2JvHlXVqqb6CdF+7FA9xb6c=;
        b=z50JG1o3nyBVmiBqd5I6AfIDVnQLO1NoALI5rPWeiW059TLnrQG8kzrTd0/mjG9jsF
         eH8gxxmRO34MkngHP1yngdnbDsmhDDWVNbmxMxpjQ9a5TnCopdnl4ntdgOv4n4l6vCKm
         un3l+CbMgPVfuKUy8t/Hj0CbUtx+7p+m08Kp5itHaCPGwy8Gk9mag55Lhmlh7DNETj47
         NEI0lUCczxQKQpL8OQdXnCAg2yaateRr7GIsjET8x51n/lbd27aM8ceioYjtzh2yjA0K
         oQ4AqeLk3uYgBnl20wljkXqGu1/6GPhGGTEtGu3Td8u/XsXMSStm/RxibzjZzMwHQ5xw
         H/tQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=K547mNNU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id jr7-20020a0562142a8700b00477077738fdsi6336782qvb.398.2022.08.23.14.45.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 23 Aug 2022 14:45:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=K547mNNU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:34288 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oQbia-0007Ai-DK
	for alex.bennee@linaro.org; Tue, 23 Aug 2022 17:45:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43500)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oQbiQ-0007AP-9F
 for qemu-arm@nongnu.org; Tue, 23 Aug 2022 17:45:42 -0400
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a]:42641)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oQbiO-0007La-Nq
 for qemu-arm@nongnu.org; Tue, 23 Aug 2022 17:45:41 -0400
Received: by mail-pg1-x52a.google.com with SMTP id 73so13357824pgb.9
 for <qemu-arm@nongnu.org>; Tue, 23 Aug 2022 14:45:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=7OgYArpRBizpVHjGzyad2JvHlXVqqb6CdF+7FA9xb6c=;
 b=K547mNNUlL1vIZA2xAX7e1DjauWXMwLkp8F6z7qI6IEgRuE6XfQ8zP2ibUL99Pj7G6
 VrvMOH2VAILQqyjURIDJBBmAzIMcw3Sr+dkpWfV0DSLC6sBgJKJrNeOgkM4AWSNPk/fB
 J1vCZJG6V38Zlii6pQu9mbmKljKRCV+nowkVSTLCY17iuJOCCh6AkdN5pOn80EVQ+lUB
 tqfg8ao5XFb7VuyqN9IhH2dmgzxUaa530vTzzpQ/r2aSRLqVQu0iQxMITpgzTFrNM6dW
 S2+hgoSWcOaeYPWBwl9wFG4VvJDBKBXwceG1Jrx/D3IzEHQfvgOHUycAED2nhgb1gAU5
 oiqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=7OgYArpRBizpVHjGzyad2JvHlXVqqb6CdF+7FA9xb6c=;
 b=OFlon2qwwWvCoIfaXy/6wYOyXHPgcqKQTV/+6HrXoIh0hZkZZgNbuzK9dQdc+bUu9P
 KHv92ys5uNQXoFpBRl3ob7Jd4eNnZ5/DSWZ5iLfvz4RC8MSpyW+8UREwtsEh7Y3YhcwH
 JOyi9/Rlm86K/V3rJSVG3jlm03D2rfsnX4YxgQR1m11HGTajQgyWny2+ZCUK0RDFV5Bk
 X1LahQrzgcQEcojYX1ij5Fpv60h0VTrMEQI/bkaErT/2hlcSQAkGOgyNAUtwOYgNPsOP
 ti1TL3sd30kQcYo5aHR0og6ehN1z52/69lkyMtLHVT/HJyZxGoQHlb0CmG4Wd2Rkm6oN
 7cHQ==
X-Gm-Message-State: ACgBeo0nsWgcAMjOgn2+61t5gSZLnzwRLEZo+nq+1DZ1elMndVy3BHg0
 0xFMpc0jDiNQXqmNKD+c00plxQ==
X-Received: by 2002:a63:81c7:0:b0:42a:9b7a:1f95 with SMTP id
 t190-20020a6381c7000000b0042a9b7a1f95mr11286538pgd.401.1661291138599; 
 Tue, 23 Aug 2022 14:45:38 -0700 (PDT)
Received: from ?IPV6:2602:47:d49d:ec01:46f9:77b4:ec0a:c2d9?
 ([2602:47:d49d:ec01:46f9:77b4:ec0a:c2d9])
 by smtp.gmail.com with ESMTPSA id
 c9-20020a170902d48900b0016db43e5212sm11152701plg.175.2022.08.23.14.45.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Aug 2022 14:45:37 -0700 (PDT)
Message-ID: <bb075424-365e-b40d-fab5-52231611c8cc@linaro.org>
Date: Tue, 23 Aug 2022 14:45:36 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] hw/arm/bcm2835_property: Add support for
 RPI_FIRMWARE_FRAMEBUFFER_GET_NUM_DISPLAYS
Content-Language: en-US
To: Enrik Berkhan <Enrik.Berkhan@inka.de>, qemu-arm@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20220812143519.59134-1-Enrik.Berkhan@inka.de>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220812143519.59134-1-Enrik.Berkhan@inka.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
X-TUID: rNKJ7XDzrUYP

On 8/12/22 07:35, Enrik Berkhan wrote:
> In more recent Raspbian OS Linux kernels, the fb driver gives up
> immediately if RPI_FIRMWARE_FRAMEBUFFER_GET_NUM_DISPLAYS fails or no
> displays are reported.
> 
> This change simply always reports one display. It makes bcm2835_fb work
> again with these more recent kernels.
> 
> Signed-off-by: Enrik Berkhan <Enrik.Berkhan@inka.de>

Thanks, queued to target-arm.next.


r~
