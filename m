Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp994161ejc;
        Fri, 20 Jan 2023 03:09:59 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvjRIgCcEkgiNg4mXdiSU1s6Bls1tZr2ulDJbwRkBGk85eQpqqWCpAocWLsRbJ5JGQNpBsC
X-Received: by 2002:a05:6214:3b13:b0:535:5cd6:38a1 with SMTP id nm19-20020a0562143b1300b005355cd638a1mr5549145qvb.39.1674212999543;
        Fri, 20 Jan 2023 03:09:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1674212999; cv=none;
        d=google.com; s=arc-20160816;
        b=CNoFKZpx1D8af9036mTxkDO9mY13dQPYj1SExNpYiGol2Z24GSQ75lOazrqLTQMuoj
         7AUzQt//fEEk4jgd0qZS8aN5kDx2X5LyeyKM34PCFYJ2W1MKoERdQrq+ZVpxv9va8+4o
         kVqURwocz5WgXnKhvUNca2egD++5r7/7UkHaCeES4lNsr7S4xBCx8YQsLOLf3SQoSxY4
         NfSEILxzyW1OP+U0PZdXjLrk0JqehMsNbGQK2EDp4qmUsVm4xkS8F07c7Q4gGKn7NPYL
         eqLLfTsHRSe0kwImPraw74wxZJBrqXshGtMPLVymeIauzpTnsevGbVlIAjaCSOvUBgL9
         bf8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=J7qrh+MTjg+/6klvkgjKOlKDXDmPUsBT3HamtGENk+E=;
        b=YmtV1y65TKioEkfhreXGvKUFnHddk3ey8AS5E8TxhN8xmmD9f8KUCELJ15h/oy60yH
         +a5itrw1k9mrnrAH3o3FIThhaM6cdREDHsGi4OoO3jec08hF5ys+rUXSGjDZireBdydx
         /Y/Yx4UW2kGa+KV+dNOxSSzzAKiwdMfxmv9V0NF4qxmGoM8RzNk8/LubFjE/toeDeMHt
         +yJv+uNyctYbf1Zk/QMrcKv9XDrKkKYKce3ji6aYjNiY8WRJ/gOIQLbXFevC/E6WokDv
         Lc/1Cel0IkqSp2+8wTcRyHqsu2jp7lX3m4BeZkGMamvICNCR7a5u1ERNdcXOqOdCPozA
         8mbQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=igrhX27M;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bl25-20020a05620a1a9900b006fbf94fc649si24485689qkb.413.2023.01.20.03.09.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 20 Jan 2023 03:09:59 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=igrhX27M;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pIpH3-0005P3-8u; Fri, 20 Jan 2023 06:09:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pIpH1-0005Oh-JK
 for qemu-arm@nongnu.org; Fri, 20 Jan 2023 06:09:31 -0500
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pIpGz-0008Ph-QX
 for qemu-arm@nongnu.org; Fri, 20 Jan 2023 06:09:31 -0500
Received: by mail-wm1-x32a.google.com with SMTP id j17so3768574wms.0
 for <qemu-arm@nongnu.org>; Fri, 20 Jan 2023 03:09:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=J7qrh+MTjg+/6klvkgjKOlKDXDmPUsBT3HamtGENk+E=;
 b=igrhX27MNlt6NEW9v37GQIi9egpmTM53Upmaxy3u+3If+CwjVF2FRs3WDJLXhPebiv
 kJ4aPlv6y3xkAsJHN8r8mhRzK6tuVH9HkkzJwvWb2S0DauO2Fewf0kNNFQSopyI+RMFg
 ETH45VTCuseNYfkd/6xXqcfK09FAiHBCmJw9Wp1NuvkpMODeagUA9dMpI69YCQ/hysId
 Nw1PvooeBCXwr4Je9Yq9NzghvaIV0nLChMkbhVzerRvLXj+AXiqGNdBCrtII03VvejH6
 AB5VLoaLxKJGgcSTh6UoaGgN2QveaN4OGOFqdsT0+V8fc+W+U3wpKja+etrXT6/Aib55
 SfFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=J7qrh+MTjg+/6klvkgjKOlKDXDmPUsBT3HamtGENk+E=;
 b=e7bmjAQTEsAZAaZc6qIww1IPszz2ff3AEMk8Yx8ffyAXOxpWbR0AnZaNJWq+M5yfWx
 Nby9mruaUaoO6qTmqZ6AwMlDDGEl/rFr0chUtG8cL+9UI4GNSkkpr+skYotUWqBIOcU/
 5XcOyWhG410LDy4olyFjd41lmrzN2yWTUH7J11VY+9Cv5JW94KWmOCs97bDbZtfhNV5J
 h2lSYBfZYQ9vrVM28v+ikjZIbL+yp/r/pUjEfsxPlHMEcw8EFpdyPg9oKk9WYMvmvrsh
 5RHSThV/btgxVXymC1O7+qJGlcNZTfjpAWBPM6VJ4SQdGo9kWLCwuH98pmAWk17qn8Ll
 PZzg==
X-Gm-Message-State: AFqh2kqFfJZHE/4nG2TIyL/uyYoBIlkm3vKuEfoQR38eZM8ccYYCaKu6
 FH91gxcChNzyl7jyPKCxa8kirw==
X-Received: by 2002:a05:600c:5386:b0:3cf:9844:7b11 with SMTP id
 hg6-20020a05600c538600b003cf98447b11mr14436513wmb.23.1674212967729; 
 Fri, 20 Jan 2023 03:09:27 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 j25-20020a05600c1c1900b003c71358a42dsm2678938wms.18.2023.01.20.03.09.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 20 Jan 2023 03:09:27 -0800 (PST)
Message-ID: <f876042f-6b6c-4c5f-7f90-3bd76ad7b6e9@linaro.org>
Date: Fri, 20 Jan 2023 12:09:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH v3 00/11] tests/qtest: Allow running boot-serial /
 migration with TCG disabled
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Fabiano Rosas <farosas@suse.de>, Juan Quintela <quintela@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, qemu-arm@nongnu.org
References: <20230120082341.59913-1-philmd@linaro.org>
 <718784c3-43c5-b621-d5a0-a8aafa492a6e@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <718784c3-43c5-b621-d5a0-a8aafa492a6e@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.094,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: MaErykPyo6Wd

On 20/1/23 10:18, Thomas Huth wrote:
> On 20/01/2023 09.23, Philippe Mathieu-Daudé wrote:
>> Missing review: #7
>>
>> Two test were failing on Darwin when testing Fabiano's series
>> which allows building ARM targets without TCG accelerator:
>> https://lore.kernel.org/qemu-devel/20230118193518.26433-1-farosas@suse.de/
>>
>> These patches allow boot-serial / migration tests to run without
>> TCG / KVM.
> 
> I just started reviewing while you were sending v3 ... please see my 
> mails in reply to v2 for some comments.

Sure.

> Also, I don't quite understand why this is necessary. If you specify 
> both, "-accel kvm -accel tcg" on the command line, QEMU should simply 
> fall back to the second accelerator if the first one is not available? 
> What's exactly the problem you are trying to solve here?

When testing Fabiano's series two tests hang, i.e. [*]:

  18/20 qemu:qtest+qtest-aarch64 / qtest-aarch64/boot-serial-test
  qemu-system-aarch64: -accel tcg: invalid accelerator tcg

Maybe it is just a matter of adding HVF to the test? I'll see
when I switch back to that. Anyhow the "invalid accelerator"
warning is annoying noise when looking for real problems in the
output.

[*] 
https://lore.kernel.org/qemu-devel/ab32e4db-2a6d-69f8-4b69-62a1f1c0f6ba@linaro.org/


