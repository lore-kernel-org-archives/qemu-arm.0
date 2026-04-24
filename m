Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D6FBFB44C8
	for <qemu-arm@archiver.kernel.org>; Fri, 24 Apr 2026 07:40:14 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wGB8u-0000CG-1N; Fri, 24 Apr 2026 03:40:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1wGB8s-000085-NC
 for qemu-arm@nongnu.org; Fri, 24 Apr 2026 03:40:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1wGB8q-0001wz-Up
 for qemu-arm@nongnu.org; Fri, 24 Apr 2026 03:40:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1777016397;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=SI/SGa+Fl8gvFPKNA0LmtddKGVN4BSl+81nPn7nNhRA=;
 b=XNkkNENuFlpFdQ84sBNzngnl6NPIGQM8Yew3TmsI78HH8rAE208fh2qlVshXtPP1pCwc2b
 /bZ6dkFQu21XRBB5OHMc9QNPkrjXvXMVmfdtoG9WQWBwrfY2tCb9/q8H8alm102tKNCLa0
 K0QE2CbFry9Pmh4TC98ts109Et5PNQs=
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com
 [209.85.215.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-3-ICm92f2mOjqSc_pXDt42MQ-1; Fri, 24 Apr 2026 03:39:55 -0400
X-MC-Unique: ICm92f2mOjqSc_pXDt42MQ-1
X-Mimecast-MFC-AGG-ID: ICm92f2mOjqSc_pXDt42MQ_1777016395
Received: by mail-pg1-f198.google.com with SMTP id
 41be03b00d2f7-c70dd30025fso9601853a12.2
 for <qemu-arm@nongnu.org>; Fri, 24 Apr 2026 00:39:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777016395; x=1777621195;
 h=content-transfer-encoding:in-reply-to:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SI/SGa+Fl8gvFPKNA0LmtddKGVN4BSl+81nPn7nNhRA=;
 b=WZ5b6FLyXwQySwbgmY3nirhe9LlRgOhs14+we18zeyTdz5v/seMInX1W3nPDzsSPjf
 GIe720/SUs4ZaYFHelylMmbPIBm3MNqAdWYK/9SAwxUh/OXd3W2esPoPOIsRBUlV0oXS
 1tVJCFJs0kPwjAD+fF2nNFuX1ifVDNiISYtDiMRW13/+c3C2CfoRSg8lBa31GWs5yskV
 KiXN+9s3eqSuAbFLiwKiJtjqgvKinQJnBatAnTpqNYDmN93gXYR0PQ8CXZ0mW9frbM8I
 LcwEXIg4oMxiU01YaQg+qB/aZHkum8kqaLsS/N4e8aNHScESldWU04z+ue8roELdDrRh
 6beA==
X-Forwarded-Encrypted: i=1;
 AFNElJ8Rj6bImQQsuDC9aVEprDlNZ1wQz/Zd0ZdoPomjgl3DOrO4+bKOqRGaVucaeJDYnUv9xk68LHpW6w==@nongnu.org
X-Gm-Message-State: AOJu0YxMk3UGSD8lcNrwBQyVxUgu+/v82DAdw1SmWF9AH0bhEepbHym9
 fdTtV1gKeAQn4Oe9rK/jR/bw3/QAK2ZyNZNsf9s41crjDKP9A/gs2Tt7xRpzTWiC4FTYUqb06e/
 L8GKGmi+c0WHsEaeXjtL51dQiaQ7vnPnlRds3b1jp1m1uZskrd21hBw==
X-Gm-Gg: AeBDiesECAZRQI91xjTo7NyQR+SHfVNnxSVuy0djoAKdqU89NTcZSaRl0k1ex/mC54m
 zzg84/oisWHDaNpRknKPJWhtnpRQPO+0MDMpaUhrV6f3yv8p5pi7FBsSN/Ym3u+CMbBnfQ3ddZ5
 WFYV2g6GoabB1MXIy4y/uu+MiZmOPQ4AXgs8Sw0GtQs9nAX2Ea5faY+9r5m3NqMjItHok4VNM8n
 dE/ADjOHmToeWzaBFoLQfGQAN83FAkeejbgP8ufLuniIFz7Q7u0xWUUsnnwnizXjhTJaQyOVXOL
 bXjFcL0ZhnOlLnfHH2NEW1ltN7w5KdkTLhsWVc7mTtXKwdsYOM3qfb+WAckEACbLzF4t1Ry8sPk
 XDCcrWXc9DWbtBzbTHZoCJGOfKre/5Q==
X-Received: by 2002:a05:6a00:3e26:b0:82a:7aa3:a2fb with SMTP id
 d2e1a72fcca58-82f8c8f07d2mr33245606b3a.37.1777016394634; 
 Fri, 24 Apr 2026 00:39:54 -0700 (PDT)
X-Received: by 2002:a05:6a00:3e26:b0:82a:7aa3:a2fb with SMTP id
 d2e1a72fcca58-82f8c8f07d2mr33245573b3a.37.1777016394150; 
 Fri, 24 Apr 2026 00:39:54 -0700 (PDT)
Received: from [192.168.0.9] ([47.64.114.147])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-82f8ebb33fcsm21580507b3a.33.2026.04.24.00.39.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 24 Apr 2026 00:39:53 -0700 (PDT)
Message-ID: <4072248e-a815-4868-80bb-a241496ffc78@redhat.com>
Date: Fri, 24 Apr 2026 09:39:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/16] tests/functional/test_aarch64_kvm: Stop dumping
 kernel ringbuf
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Roman Bolshakov <rbolshakov@ddn.com>,
 Jonathan Cameron <jonathan.cameron@huawei.com>, Mads Ynddal
 <mads@ynddal.dk>, qemu-arm@nongnu.org,
 Mohamed Mediouni <mohamed@unpredictable.fr>,
 Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Alexander Graf <agraf@csgraf.de>
References: <20260423170229.64655-1-philmd@linaro.org>
 <20260423170229.64655-5-philmd@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20260423170229.64655-5-philmd@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: -cP18_1IUm5V-huZny2T6ZyrA5u2OIIO8hnt0jVc9cg_1777016395
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On 23/04/2026 19.02, Philippe Mathieu-Daudé wrote:
> Avoid the following kernel message to interfere our stdout parsing:
> 
>    platform gpio-keys: deferred probe pending: gpio-keys: failed to get gpio
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   tests/functional/aarch64/test_kvm.py | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/tests/functional/aarch64/test_kvm.py b/tests/functional/aarch64/test_kvm.py
> index 7545f5ed554..a03a6134626 100755
> --- a/tests/functional/aarch64/test_kvm.py
> +++ b/tests/functional/aarch64/test_kvm.py
> @@ -48,6 +48,7 @@ def _launch_guest(self, kvm_mode="nvhe"):
>   
>           self.wait_for_console_pattern('buildroot login:')
>           ec_and_wait(self, 'root', '#')
> +        ec_and_wait(self, 'dmesg -n 1', '#')
>           ec_and_wait(self, f"export PS1='{self.PS1}'", self.OK_CMD)

In other tests, we are adding "quiet" to the kernel_command_line to avoid 
this problem - that way the kernel messages also cannot interfere with the 
login prompt. Could you check whether that works here, too? If so, I think 
I'd rather prefer that solution instead.

  Thanks,
   Thomas


