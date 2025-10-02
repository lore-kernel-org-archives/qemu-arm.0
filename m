Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4344CAC5B8
	for <qemu-arm@archiver.kernel.org>; Thu,  2 Oct 2025 17:53:24 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v4NTh-0007oq-Qz; Thu, 02 Oct 2025 13:52:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1v4NTb-0007ms-0R
 for qemu-arm@nongnu.org; Thu, 02 Oct 2025 13:52:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1v4NTQ-0000Xx-Av
 for qemu-arm@nongnu.org; Thu, 02 Oct 2025 13:52:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1759427524;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=foEpRowZ01PqTKvoM2xThhJ8MmKeG842BlGMmgn/k4c=;
 b=Vp0qV3crqZRUs5uEkrcDBsnTh9vkmKgq4WlyXmfaz7trvfA/kvVWCR4vY0KqHBXxCV3IFh
 0A/D1BNzZChJhyN4S77PNQMNq9mmS73ze6+r7GOtXZrVfUa9sCadKKV8QXzz55cnnudvvj
 Rqz00t5Y96xQ8HRdQT8NbAX7D+62m4A=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-325-jFQXuA41MTGPs8e98x3MmQ-1; Thu, 02 Oct 2025 13:52:03 -0400
X-MC-Unique: jFQXuA41MTGPs8e98x3MmQ-1
X-Mimecast-MFC-AGG-ID: jFQXuA41MTGPs8e98x3MmQ_1759427522
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-42557bdbe50so1399233f8f.1
 for <qemu-arm@nongnu.org>; Thu, 02 Oct 2025 10:52:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759427522; x=1760032322;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :references:cc:to:from:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=foEpRowZ01PqTKvoM2xThhJ8MmKeG842BlGMmgn/k4c=;
 b=lmTQ1Gtpuu/y+KxR4+uFnnAZ7vCwUp7OQHk9lTITRf5GBx7Lv9lc1wI7RkiWevgNRu
 IvjlG0cJNXC8bRkZgE+MTtzbeXcfHMig+hSsHJ5LatmnkqNv+jjwfYFvGwpYqPKVoFy+
 lSX+7A3J8eMTteic6x2z/9ELS0rGMKTGgduFzNwyRq32T+BxIm0eouwGQ7V03i/YYXAl
 I5vdbFVWd5Umqh26D66Lf/l66909+KK/ySNoO+eeG0XziDjRbYWKGQ6FJAdlpqkxqdHp
 erMQVX9zpjQVL5oNlVbHCSCGlbWsuWrxS/oB/Pi7yLkWt8HKO18eQ/8SapEZY3Ulpnd3
 fRIw==
X-Gm-Message-State: AOJu0Yw1kpSmhaPlxfWorV9QyB2oXlFiV7FX+wH2B2QYu3MteQdEeT6O
 L33TCuYw1KH86Qk2D9/2p9bgMXjZ61EbhtUPUigbSnh5t4h9U2wxP3UV2XF9HGNPTmye0BbYxNG
 I9uRY+SxvA5A/hCUxYKgjPBT8qU5qv0HJH5oSYkKsnycBshl4z8c+lw==
X-Gm-Gg: ASbGncuyaiURMguwCxxVSjDeZK/UeUOigYN6J6i4VujumOJc/pU5/AXX/ZOluW92Zwz
 8nmVf68saEdx2mzj2NBDpWBlLpODBxo9IDeBe+Gmjc1t5mNV3FikyufzVxVNG6WB9XXO1tibO4R
 3tyJugoMBa3c4qW+xD6lKh7d6CDbmwIvuBaOOleFBfRFmmuSjEdMVAz02bFnQn4JyfxKW6V/xRj
 zbdTy6z0YguzNvbHdwjL60Lvx/A3sfw161FgI8bBAGRhNZtj+78KYJcc+/GpRSDBpxI50Z9T40y
 K80pXDEr+MsxmI5YeUYT2bsBnt4LgRB39jZ6rZAinr+ik56dXMAewlgI6LZrVbvcLKUgWVY93EN
 OY8FwU7L4Jg==
X-Received: by 2002:a05:600c:1d05:b0:46e:477a:f3e3 with SMTP id
 5b1f17b1804b1-46e70cb75c3mr2139575e9.18.1759427522131; 
 Thu, 02 Oct 2025 10:52:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IETa7VcbZV1dy4v3P42ErfHfC0GoB0wdHq7sh3UMSAvVXCKD71ZwKIjqKqUMoye5kN0vUrBzg==
X-Received: by 2002:a05:600c:1d05:b0:46e:477a:f3e3 with SMTP id
 5b1f17b1804b1-46e70cb75c3mr2139435e9.18.1759427521719; 
 Thu, 02 Oct 2025 10:52:01 -0700 (PDT)
Received: from [192.168.0.7] (ltea-047-064-114-056.pools.arcor-ip.net.
 [47.64.114.56]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-46e693bcc93sm44043815e9.13.2025.10.02.10.52.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 Oct 2025 10:52:01 -0700 (PDT)
Message-ID: <8fb3351e-f1a1-4a1e-9650-33f0d4ee6d44@redhat.com>
Date: Thu, 2 Oct 2025 19:52:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 0/9] tests/functional: Adapt reverse_debugging to run
 w/o Avocado
From: Thomas Huth <thuth@redhat.com>
To: Gustavo Romero <gustavo.romero@linaro.org>, qemu-devel@nongnu.org,
 alex.bennee@linaro.org, berrange@redhat.com
Cc: qemu-arm@nongnu.org
References: <20251002020432.54443-1-gustavo.romero@linaro.org>
 <b5cb30d8-65a2-4bf7-b66f-5bfe61e19835@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <b5cb30d8-65a2-4bf7-b66f-5bfe61e19835@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: XLfsR4EnLsExrNXNeAzNc3kl0cW6xhis_jjvGzkykE8_1759427522
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.451,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 02/10/2025 18.53, Thomas Huth wrote:
> On 02/10/2025 04.04, Gustavo Romero wrote:
>> The goal of this series is to remove Avocado as a dependency for running
>> the reverse_debugging functional test.
>>
>> After several rounds of discussions about v1 and v2, and experiments
>> done by Daniel and Thomas (thanks for all the experiments and comments
>> so far), I've taken a new approach and moved away from using a runner
>> for GDB. The changes, I believe, are much simpler now.
> 
>   Hi Gustavo,
> 
> unfortunately, this still seems to be broken on Fedora. After applying your 
> series, I get:
> 
> stderr:
> Traceback (most recent call last):
>    File "/home/thuth/devel/qemu/tests/functional/reverse_debugging.py", line 
> 100, in reverse_debugging
>      self.reverse_debugging_run(vm, port, gdb_arch, last_icount)
>      ~~~~~~~~~~~~~~~~~~~~~~~~~~^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>    File "/usr/lib64/python3.13/unittest/case.py", line 156, in skip_wrapper
>      raise SkipTest(reason)
> unittest.case.SkipTest: Missing env var(s): QEMU_TEST_GDB

Looks like it's required to explicitly use the --gdb=... parameter of 
configure to make it work, and it does not work without that paramter? Could 
you please have a look whether it works without --gdb with the auto-detected 
gdb for you?

  Thomas


