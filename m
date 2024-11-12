Received: by 2002:a17:505:610b:b0:1be9:327d:8ee3 with SMTP id tt11csp7339243njc;
        Tue, 12 Nov 2024 05:46:43 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWNyOEhyNNRbTeyU93qKEzdXGAqnTWUd/CDKYVpjuh2/mKdvG9dWRjNNlTO0lGD7fTYfdBnszcFHaXIxA==@linaro.org
X-Google-Smtp-Source: AGHT+IEvUnymCugY2FfVQCDdqXo4wyvE9iXlKq/eVu/tdyFXrXRfFmBonAFBPMmPLjogZVLrdzIR
X-Received: by 2002:a05:690c:7203:b0:6e2:1527:446b with SMTP id 00721157ae682-6eaddd8b089mr168526027b3.3.1731419203000;
        Tue, 12 Nov 2024 05:46:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1731419202; cv=none;
        d=google.com; s=arc-20240605;
        b=GBzju/HoPWiC0K7d1eciAVKuU+WMYGKvm1VK2zGIMntqxOAS4nzYVFyQoI0n2pXeEJ
         E44kftR2sWAU4yh/llMtApFdCTtAg4NrUOh/vCZQNSioMZYiI8lzB6CeD7QsYutxXdVJ
         7bv2ITfv3KO0HdIDz7GYkxSN/F/1gbTdVVXhZGpFuCrbltdc6BbKI2V6R0Kk28rEuwvb
         olJSCUhH9itJzisCiquhP/odhJqx6es0SsN3SXVKlnIXsJ/cKiRZJdj/nl+o/9m6BHxK
         nMt1GLz96+zbZYMgw/QLDv1xusKlpX4jq5aPf68fr3fPRvWIRwkypWRArs1dkuGNW5ru
         o77g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:autocrypt:from:references:cc:to
         :subject:user-agent:mime-version:date:message-id:dkim-signature;
        bh=6mtJ1GNESwSYjCUk7/pfoTAkCNIunNZRJDvMPqmOLp0=;
        fh=w0gevXnZBAqUQTtxLwjssse5Pji5XxvLyD0TMtHsDU0=;
        b=cAyUhRlHB8vf+Cwzxmcl/P0GX2BJLkC/JhwiLezaszdEl3PDA/TevD62jQqM0qQkxy
         Wkw8ThWJWt1WA29ZfzHxdiWPV3mDoXfDfZ9w/DNohTogeJC1Iod6Y/8DsJN7b4TNMRGq
         qyy/vGRaNan4GrUf5YI+wlguKVthg187MJK11JBO5OW+Rwze2uVLeeBloprlspeGv6os
         Malgkp6j620BYUOgOLaXXPZSSeM/A3ukmbM7sNZZSh98zqx/cvusn5dycNQWMbLQn5Ph
         9y1TKw1Z6HpsNEcJ7rSzd7CZeMx/hWKrgIYs8F2ddxQYzEwB95XDLkImhjDf3dT8c+N9
         x2uw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=U475Cjyh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6d39620f445si137590036d6.61.2024.11.12.05.46.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 12 Nov 2024 05:46:42 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=U475Cjyh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tArDi-0000dm-7y; Tue, 12 Nov 2024 08:46:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1tArDV-0000bD-HP
 for qemu-arm@nongnu.org; Tue, 12 Nov 2024 08:46:01 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1tArDT-0002cN-16
 for qemu-arm@nongnu.org; Tue, 12 Nov 2024 08:46:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1731419156;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=6mtJ1GNESwSYjCUk7/pfoTAkCNIunNZRJDvMPqmOLp0=;
 b=U475CjyhiJmyzFqaa38o2rIKC08SsXkXJEGYVMkwJXRQAJsBiB+o5d3tVz3/eH9DJc7UgU
 wDkEAW2xyVKoq3w47ZdSRgPuKHJ9vQ9IW8l8MGnZPEJLdqlkLNRFKA+rvwIDt+cJ/ieaJZ
 hwZo5tMY1va/yhvLEDIfRiSomV0mRLk=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-554-0a_pT0UAPcuvJKAU4KlZVQ-1; Tue, 12 Nov 2024 08:45:54 -0500
X-MC-Unique: 0a_pT0UAPcuvJKAU4KlZVQ-1
X-Mimecast-MFC-AGG-ID: 0a_pT0UAPcuvJKAU4KlZVQ
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-7b163e0a5ecso689594685a.1
 for <qemu-arm@nongnu.org>; Tue, 12 Nov 2024 05:45:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731419154; x=1732023954;
 h=content-transfer-encoding:in-reply-to:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6mtJ1GNESwSYjCUk7/pfoTAkCNIunNZRJDvMPqmOLp0=;
 b=kQJXmzCvGqjUHAb0FJcYCysmK727ld21fDdpRtpBt8FoQBGnOpKPJ4/XkA7flxp0FR
 KqkGp/+TRF9nS5+p+fUR7GK0uXsBL6GHJZml9Olw0TfTtKvv6bw/3ZPz1PsafzuKBGvW
 k7T01g7J4tX8u/Ux4R4RXLhnTPUJAgtbjK/Z8E7/42/dIHAviTbsifkcefLpbiXu54TN
 gHNITs2Ftztw3m7WxzUt4nVrNlSjFo6VsXj2QkL6OqUSQ7lGLWgYN86KmCHDft1fPzMR
 Lb0kRyEGV1WjUu/qrAVT/yt3LZrq7morlOIf4eVpVDpUmUu1VJEWB2IvVsyklH8hP3eX
 Dh8w==
X-Forwarded-Encrypted: i=1;
 AJvYcCWfnvfQqFMk+HSh9mVNPQbB2cNt/WAYh2LtJWWqcTdsOZIRlom22oEtZot/PAGP5lSOjcdB+IbmLA==@nongnu.org
X-Gm-Message-State: AOJu0YwYO8Z+GqJL1crOItUqrDgDiXxiaGTkCr922jImOLM8Ucy8ARiq
 R3oVgRLRCOGbqWOAEo67G1yPBaTKlHEgWVR+0V+e01/psdGfKp7P8yIOaYgKMlmZW6YT2ja69YY
 G1+Zkn2ZotEL/87F1TAPvKlS0Uc3/XkbGO4Db15Ib1D8Eo5+JnA==
X-Received: by 2002:a05:620a:4041:b0:7b1:49cf:6460 with SMTP id
 af79cd13be357-7b331f2ed00mr2234621785a.59.1731419154286; 
 Tue, 12 Nov 2024 05:45:54 -0800 (PST)
X-Received: by 2002:a05:620a:4041:b0:7b1:49cf:6460 with SMTP id
 af79cd13be357-7b331f2ed00mr2234618785a.59.1731419153889; 
 Tue, 12 Nov 2024 05:45:53 -0800 (PST)
Received: from [192.168.0.7] (ip-109-42-49-115.web.vodafone.de.
 [109.42.49.115]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-7b32ac2da65sm593243685a.13.2024.11.12.05.45.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Nov 2024 05:45:53 -0800 (PST)
Message-ID: <519d031b-ed11-4fed-b25b-e73dc28a9e9b@redhat.com>
Date: Tue, 12 Nov 2024 14:45:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] tests/functional: Introduce _console_read()
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@redhat.com>,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Steven Lee <steven_lee@aspeedtech.com>, Troy Lee <leetroy@gmail.com>,
 Jamin Lin <jamin_lin@aspeedtech.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
References: <20241112130246.970281-1-clg@redhat.com>
 <20241112130246.970281-2-clg@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20241112130246.970281-2-clg@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: NeHXiqdJK6z0Yw8TixtdAa63XsYknVu0xXVfQ4yPrwM_1731419154
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.122,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: MxHHiWYCb9cH

On 12/11/2024 14.02, Cédric Le Goater wrote:
> Interaction with the console has been a problem in our avocado
> tests. In some cases, the expected string does not match in the
> output, causing the test to fail with a timeout. These were worked
> around by sleeping before reading the console and even with SSH
> connections in some places.
> 
> To fix, process the console output char by char and not with
> readline. This routine was largely inspired by console_wait() in
> tests/vm/basevm.py.
> 
> Signed-off-by: Cédric Le Goater <clg@redhat.com>
> ---
>   tests/functional/qemu_test/cmd.py | 22 ++++++++++++++++++++--
>   1 file changed, 20 insertions(+), 2 deletions(-)
> 
> diff --git a/tests/functional/qemu_test/cmd.py b/tests/functional/qemu_test/cmd.py
> index cbabb1ceed3c..5bca29d1d721 100644
> --- a/tests/functional/qemu_test/cmd.py
> +++ b/tests/functional/qemu_test/cmd.py
> @@ -12,6 +12,7 @@
>   # later.  See the COPYING file in the top-level directory.
>   
>   import logging
> +import re
>   import os
>   import os.path
>   import subprocess
> @@ -78,6 +79,23 @@ def run_cmd(args):
>   def is_readable_executable_file(path):
>       return os.path.isfile(path) and os.access(path, os.R_OK | os.X_OK)
>   
> +def _console_read(vm, expect):
> +    console_logger = logging.getLogger('console')
> +    output = ""
> +    while True:
> +        data = vm.console_socket.recv(1)
> +        if not data:
> +            break
> +        output += data.decode("latin1")
> +        if expect in output:
> +            break
> +        if "\r" in output or "\n" in output:
> +            lines = re.split("[\r\n]", output)
> +            if lines[0]:
> +                console_logger.debug(lines[0])
> +            output = lines.pop()
> +    return output
> +
>   def _console_interaction(test, success_message, failure_message,
>                            send_string, keep_sending=False, vm=None):
>       assert not keep_sending or send_string
> @@ -98,12 +116,12 @@ def _console_interaction(test, success_message, failure_message,
>               continue
>   
>           try:
> -            msg = console.readline().decode().strip()
> +            msg = _console_read(vm, success_message)
>           except UnicodeDecodeError:
>               msg = None
>           if not msg:
>               continue
> -        console_logger.debug(msg)
> +        console_logger.debug('found "%s"', msg)

Sorry for being picky (yay, bike shed painting!), but it's a little bit hard 
to distinguish these "found" markers in the console.log from the lines that 
just contain the normal output.

Maybe we could use some funky unicode character instead? For example:

         console_logger.debug('🔎 %s', msg)

or:

         console_logger.debug('✅ %s', msg)

?

Or maybe just indent the normal lines, i.e. in the _console_read() function
you could do this instead:

        console_logger.debug('      %s', lines[0])

so that the "found" string is more visually separated?

Or maybe even combine the two approaches?

  Thanks,
   Thomas

