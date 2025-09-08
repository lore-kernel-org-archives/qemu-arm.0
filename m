Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D722CCAC581
	for <qemu-arm@archiver.kernel.org>; Mon,  8 Sep 2025 09:13:42 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uvXvx-0001xo-FO; Mon, 08 Sep 2025 05:13:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1uvXvu-0001xQ-RK
 for qemu-arm@nongnu.org; Mon, 08 Sep 2025 05:13:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1uvXvi-0001Ok-AF
 for qemu-arm@nongnu.org; Mon, 08 Sep 2025 05:13:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1757322764;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=H5DedatCWHavDvoZrpKK8PehOpLyFx44MUtfOsHcLfU=;
 b=UsaPZ/2YYTDeaVbUg460beafCg2I4Z+AiyAhhZKWlC4Xn2jBd0beVLrltjnItXMLH5X+bM
 W5BomVIEb45MsH44eoG9oZyGEW5CGTHFJG6fn44DgSeZlOx9YL+LPDcfh551L37qK8nknx
 jjYsMs2naKe/tlQISQmFXs+QdPW3KT0=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-643-XXf_JZA9OQuTyEku_aDCrQ-1; Mon, 08 Sep 2025 05:12:43 -0400
X-MC-Unique: XXf_JZA9OQuTyEku_aDCrQ-1
X-Mimecast-MFC-AGG-ID: XXf_JZA9OQuTyEku_aDCrQ_1757322762
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-45dd56f0000so24492435e9.2
 for <qemu-arm@nongnu.org>; Mon, 08 Sep 2025 02:12:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757322762; x=1757927562;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=H5DedatCWHavDvoZrpKK8PehOpLyFx44MUtfOsHcLfU=;
 b=l/o8B2DCEIGHJQiA5BT1xn9whFvuWa0MQEhLa6uqk312YuTLb3fRGVOUyvmnlI9lc+
 b/eGWMECcsq0M4pFiuuOAu4pI++wKXK/1eauxSOZE5FVix1xVx6l1nXMh1W3Hm08UVJj
 qQVTdD1n0zyt5UNvERqmTlUr6DDET0VaEwuLYsBDguJHJV9j3jg9HRkgqrVTrQNG3WQi
 sKFaidlVVLI11UVjfKx+5f+DM80ebkkVX/xN958P+9uHyIbF6YxY9LzgfXmotLuKE5ZC
 O0JRwT+UQTkA30VpRMBWXo5JTsEkPbAQeFunoxtF3K/JjvtnRIZ4JC+W+OHEsCvcF7+A
 NAsQ==
X-Gm-Message-State: AOJu0YwKmeNj0v/1IhSx/FXU7JzINhjl/Y3Vs32ZdOpx2FiHHzk1zpel
 NGDrLaHWhjBwrfZH7TcxR3UuS1vV3yr2kTqRZ2XAVYfz+Gjt1g2cOgBHtoPYPVjqYE6y11d3IW4
 Dn7MUZy3Qg1C1QrOXiiNPAX1BziZkCqogN3U+y6OjP9Nav8HWJKDn33j3gwlxviFm
X-Gm-Gg: ASbGncvl2eq/bBX4mkIK7sI6M8jutnEgj5NHuKxhgjC/mxugFdLMW0EIEd/iIMni8pA
 2hXgEeRWUvWivZYJCyIzNWQPcmGu6o6jo9y/VYgYCwoNRwYNEK6az+fiOy4gnbXupfA+L3/hYaO
 qQPtQDe42wUQcfOmb0wi7isFk1ZqyueSEIjmBdPyB+A9zzHD41pXl3F85ZVk9SNdSWGthD45ptN
 xtqDpSfCz0r7+KfqZw1TGJ2YMqDqK8TlnAS3QtjIpBUYDdiE3eY3lq9AYkwHvNjimUnJ6o3bhbf
 g08nLfJU5TgNcCkwK0OCwFIwcLQlkfLs2lNe94Y30HT9MDQ6f9V+T3jclywHb0d9LJ1KJQ+QzyS
 VYNH/0w==
X-Received: by 2002:a05:600c:1912:b0:459:e398:ed89 with SMTP id
 5b1f17b1804b1-45de2cf9a5cmr39526155e9.1.1757322762442; 
 Mon, 08 Sep 2025 02:12:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGnisDzvToDGNWlrdFaGcylw8y03P/b0yNQySgMB6iaWqScPPEk/XLZ4CAP7VY+3cwWUrPhOQ==
X-Received: by 2002:a05:600c:1912:b0:459:e398:ed89 with SMTP id
 5b1f17b1804b1-45de2cf9a5cmr39525825e9.1.1757322761975; 
 Mon, 08 Sep 2025 02:12:41 -0700 (PDT)
Received: from [192.168.0.5] (ltea-047-064-114-112.pools.arcor-ip.net.
 [47.64.114.112]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45dd2304e16sm179056905e9.7.2025.09.08.02.12.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Sep 2025 02:12:41 -0700 (PDT)
Message-ID: <e43d5fa3-6687-4837-b99c-5d95f0e563f1@redhat.com>
Date: Mon, 8 Sep 2025 11:12:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/5] tests/guest-debug: Add quiet option to run-tests.py
To: Gustavo Romero <gustavo.romero@linaro.org>, qemu-devel@nongnu.org,
 alex.bennee@linaro.org, berrange@redhat.com
Cc: qemu-arm@nongnu.org, 1844144@gmail.com
References: <20250904154640.52687-1-gustavo.romero@linaro.org>
 <20250904154640.52687-4-gustavo.romero@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20250904154640.52687-4-gustavo.romero@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: QPGssDULVnksEt5wD3-zTs-vfbK5wP0YpY1yJa5saFY_1757322762
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=-1,
 RCVD_IN_MSPIKE_WL=-0.01, RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, SPF_PASS=-0.001,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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

On 04/09/2025 17.46, Gustavo Romero wrote:
> Add a --quiet option to run-tests.py so it can run without printing any
> messages to the stdout.
> 
> Signed-off-by: Gustavo Romero <gustavo.romero@linaro.org>
> ---
>   tests/guest-debug/run-test.py | 10 ++++++----
>   1 file changed, 6 insertions(+), 4 deletions(-)
> 
> diff --git a/tests/guest-debug/run-test.py b/tests/guest-debug/run-test.py
> index e051e8947c..cf8b37b8b8 100755
> --- a/tests/guest-debug/run-test.py
> +++ b/tests/guest-debug/run-test.py
> @@ -39,15 +39,17 @@ def get_args():
>       parser.add_argument("--stderr", help="A file to redirect stderr to")
>       parser.add_argument("--no-suspend", action="store_true",
>                           help="Ask the binary to not wait for GDB connection")
> +    parser.add_argument("--quiet", action="store_true", default=False,
> +                        help="Don't print any messages to stdout")
>   
>       return parser.parse_args()
>   
>   
> -def log(output, msg):
> +def log(output, msg, quiet):
>       if output:
>           output.write(msg + "\n")
>           output.flush()
> -    else:
> +    elif not quiet:
>           print(msg)
>   
>   
> @@ -91,7 +93,7 @@ def log(output, msg):
>               cmd = f'{args.qemu} {args.qargs} -g {socket_name}{suspend}' \
>                   f' {args.binary}'
>   
> -        log(output, "QEMU CMD: %s" % (cmd))
> +        log(output, "QEMU CMD: %s" % (cmd), args.quiet)
>           inferior = subprocess.Popen(shlex.split(cmd))
>   
>       # Now launch gdb with our test and collect the result.
> @@ -117,7 +119,7 @@ def log(output, msg):
>   
>   
>       sleep(1)
> -    log(output, "GDB CMD: %s" % (gdb_cmd))
> +    log(output, "GDB CMD: %s" % (gdb_cmd), args.quiet)
>   
>       gdb_env = dict(os.environ)
>       gdb_pythonpath = gdb_env.get("PYTHONPATH", "").split(os.pathsep)

I can see two more calls to log() in that script, don't you need to change 
these spots, too:

$ grep log tests/guest-debug/run-test.py
def log(output, msg):
     log(output, "QEMU CMD: %s" % (cmd))
     log(output, "GDB CMD: %s" % (gdb_cmd))
         log(output, "GDB crashed? (%d, %d) SKIPPING" % (result, result - 128))
         log(output, "GDB never connected? Killed guest")

?

Maybe you could declare the new parameter with quiet=False by default, so 
that you don't have to worry?

  Thomas


