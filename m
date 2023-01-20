Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp897186ejc;
        Thu, 19 Jan 2023 23:32:48 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvzqcEy/nf1qceoKx1+yH0f7PzBqtz96hdJVdThdNYqsrI/bFq46wVQzhMqnfV9L3EwYhZC
X-Received: by 2002:ac8:4914:0:b0:3b1:ad76:eefe with SMTP id e20-20020ac84914000000b003b1ad76eefemr20466412qtq.10.1674199968711;
        Thu, 19 Jan 2023 23:32:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1674199968; cv=none;
        d=google.com; s=arc-20160816;
        b=qHLjaXXs90LQk4yCGf7tPk4k6CXeNDtUfU76gmffL50wR3TlR87jkAkqEKKxf8ovGo
         I6O30p8ZPKGozq28LAMoJke1sHlpsrPrgNnN1i95gwpc7ZJct9vxoCTcM7yI8MtLpaCw
         K/6SAHLSla/oSr3dU/xm4WKz36l/gQ9EUmE4NFEpkk/yzC86gIchSnEehSW+qGsuu8HL
         5OS7Xa9rDPEYWpmrIHxxKoJYLGlrN3+IIM0IT5Vb5Sur02u7Rhy8WUtuGNyVw7emleLE
         yahcY6lManRDHcJcjmzpVcjcyld3rqL+QTFj4wimRV+rVHnu4O064mGpL4UFmzwILPcK
         nOhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=yzhvZFutE7S6+uC6TVcEW9GptLU9pvUHwFqb546VN+Y=;
        b=pQKXCdRXIqxERKdUUM8zGL7Mn3oXuV0vJssRpxnH3UHEs58Dqk5+IZSGIEjc0dnMY6
         TtDTAPM0R6IyBP1YOcyMNn6asJMN/PDscF4elotXj3epJoBjjyYPrx4fAHQxgglPp6ox
         o8gNcrYtwALcNF4gSu58vc0dDrK3p58/1uVdESN2ED31qcFtWWZ1SfcCWvvOjRs6ySNL
         3OD+d+xu53H85B0Sc386Bm6X7qhakjZPE/b49rKuQcffcAy/l5oOGvapWxPmgUyP9umT
         LIrSgpvxgp3SXKZYaXecC2jRKNNndvAXoelrIUkuqhJHsU7SiHQovtMjgL6/oyCyBIWp
         1RUg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=UZkzRNLG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c10-20020ac8110a000000b0034b66d9bbd2si23408845qtj.652.2023.01.19.23.32.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 19 Jan 2023 23:32:48 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=UZkzRNLG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pIlss-0004wR-LU; Fri, 20 Jan 2023 02:32:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pIlsq-0004vf-Pe
 for qemu-arm@nongnu.org; Fri, 20 Jan 2023 02:32:20 -0500
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pIlso-0003IE-Fl
 for qemu-arm@nongnu.org; Fri, 20 Jan 2023 02:32:20 -0500
Received: by mail-wm1-x331.google.com with SMTP id l8so3300523wms.3
 for <qemu-arm@nongnu.org>; Thu, 19 Jan 2023 23:32:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=yzhvZFutE7S6+uC6TVcEW9GptLU9pvUHwFqb546VN+Y=;
 b=UZkzRNLGvXvhytfX0ByWI0pSHatuAQwqjif7+KqRt2qZ1uN0TY4nlpunRWdPFvueQO
 sM4NlELJ54ZNAXemprjqbkcMjnV9lRXSccdtl956jtlZQ4KoqLQX2ma0LmB/OCJ/iYf/
 N6xhC1FNAvGSCQEidRHEbSvS34KY2r3hZd7WQOI45nDn0csA2B6hYFbfGjPPEe5+LhW9
 EW5DdF1Ym6C9Bf1jPqej1swEnCXbpytcYmBAhy1hKg9PkpqRfv59/I3SvQw4J9Z/pnwX
 4bZt6MTorIy2PWD22TKqOUgYKPECWacXb96tG/wkbX+fxu+hYXPQsxu0/Vjh8cE+P4HE
 paCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=yzhvZFutE7S6+uC6TVcEW9GptLU9pvUHwFqb546VN+Y=;
 b=v5O78cjhkuQipxNFMQLhjHXcooDYu4O0cm6smRaMQTGKCt+bLn3gFRJx6GAZLW8QXp
 xiDuMT/TrjCW9aSCJzBQJkHx5E+aiYH/+Y4EsEcl4DCdXU149qvuSnamBa4dLAOrMAsk
 xHZUJgsoPJfwnp+dNb9m42/3QzqFfnS5nIWVtjkqdMdThtLwug62wKEI+LMfGb3DOAor
 Ag+czXxd9cjcB51U0tggCriAB7ZOOAJqyR7Rm5uTNyU3NHY3Fv4NPUXnOhC4o7TISLgB
 b4wPrGmj1YPBzWZcvK0iV8MI/4pOkz9RQluBidfAqDLENCX80TdDyl7Dwmewnh8VuyRq
 JzXw==
X-Gm-Message-State: AFqh2kp7OUF8LazjSbqzvd16nmy+6tZKSuf1Y1PlD2V5lSaJF2pF8NMk
 AbQlNHAkTeSatJ+RcwYBWpppfg==
X-Received: by 2002:a05:600c:2255:b0:3da:f950:8168 with SMTP id
 a21-20020a05600c225500b003daf9508168mr12480769wmm.35.1674199936784; 
 Thu, 19 Jan 2023 23:32:16 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 d4-20020a05600c3ac400b003d9fa355387sm1378390wms.27.2023.01.19.23.32.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Jan 2023 23:32:16 -0800 (PST)
Message-ID: <8af15c5e-044d-ffa4-cb78-85b9f5e0fbb2@linaro.org>
Date: Fri, 20 Jan 2023 08:32:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH v2 07/11] tests/qtest/migration-test: Build command line
 using GString API (1/4)
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: Juan Quintela <quintela@redhat.com>, Laurent Vivier <lvivier@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-arm@nongnu.org,
 Fabiano Rosas <farosas@suse.de>, Thomas Huth <thuth@redhat.com>
References: <20230119145838.41835-1-philmd@linaro.org>
 <20230119145838.41835-8-philmd@linaro.org>
 <ca41b949-e31e-ba69-7876-e6180ef52a3b@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <ca41b949-e31e-ba69-7876-e6180ef52a3b@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x331.google.com
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
X-TUID: GnNuS473HVP7

On 19/1/23 22:10, Richard Henderson wrote:
> On 1/19/23 04:58, Philippe Mathieu-Daudé wrote:
>> Part 1/4: Convert memory & machine options.
>>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>> ---
>>   tests/qtest/migration-test.c | 22 ++++++++++++----------
>>   1 file changed, 12 insertions(+), 10 deletions(-)
>>
>> diff --git a/tests/qtest/migration-test.c b/tests/qtest/migration-test.c
>> index 6c3db95113..7aa323a7a7 100644
>> --- a/tests/qtest/migration-test.c
>> +++ b/tests/qtest/migration-test.c
>> @@ -582,6 +582,7 @@ typedef struct {
>>   static int test_migrate_start(QTestState **from, QTestState **to,
>>                                 const char *uri, MigrateStart *args)
>>   {
>> +    g_autoptr(GString) cmd_common = NULL;
>>       g_autofree gchar *arch_source = NULL;
>>       g_autofree gchar *arch_target = NULL;
>>       g_autofree gchar *cmd_target = NULL;
>> @@ -601,6 +602,9 @@ static int test_migrate_start(QTestState **from, 
>> QTestState **to,
>>       }
>>       got_stop = false;
>> +
>> +    cmd_common = g_string_new("");
>> +
>>       bootpath = g_strdup_printf("%s/bootsect", tmpfs);
>>       if (strcmp(arch, "i386") == 0 || strcmp(arch, "x86_64") == 0) {
>>           /* the assembled x86 boot sector should be exactly one 
>> sector large */
>> @@ -644,6 +648,10 @@ static int test_migrate_start(QTestState **from, 
>> QTestState **to,
>>       } else {
>>           g_assert_not_reached();
>>       }
>> +    if (machine_opts) {
>> +        g_string_append_printf(cmd_common, " -machine %s ", 
>> machine_opts);
>> +    }
>> +    g_string_append_printf(cmd_common, "-m %s ", memory_size);
>>       if (!getenv("QTEST_LOG") && args->hide_stderr) {
>>   #ifdef _WIN32
>> @@ -674,33 +682,27 @@ static int test_migrate_start(QTestState **from, 
>> QTestState **to,
>>       if (!args->only_target) {
>>           g_autofree gchar *cmd_source = NULL;
>> -        cmd_source = g_strdup_printf("-accel kvm%s -accel tcg%s%s "
>> +        cmd_source = g_strdup_printf("-accel kvm%s -accel tcg%s "
>>                                        "-name source,debug-threads=on "
>> -                                     "-m %s "
>>                                        "-serial file:%s/src_serial "
>>                                        "%s %s %s %s",
>>                                        args->use_dirty_ring ?
>>                                        ",dirty-ring-size=4096" : "",
>> -                                     machine_opts ? " -machine " : "",
>> -                                     machine_opts ? machine_opts : "",
> 
> You removed two strings here, but only one %s above.

>> -                                     memory_size, tmpfs,
>> +                                     cmd_common->str, tmpfs,

One new string is added here             ^^^^^^^^^^^^^^^.

>>                                        arch_source, shmem_opts,
>>                                        args->opts_source ? 
>> args->opts_source : "",
>>                                        ignore_stderr);
>>           *from = qtest_init(cmd_source);
>>       }
>> -    cmd_target = g_strdup_printf("-accel kvm%s -accel tcg%s%s "
>> +    cmd_target = g_strdup_printf("-accel kvm%s -accel tcg%s "
>>                                    "-name target,debug-threads=on "
>> -                                 "-m %s "
>>                                    "-serial file:%s/dest_serial "
>>                                    "-incoming %s "
>>                                    "%s %s %s %s",
>>                                    args->use_dirty_ring ?
>>                                    ",dirty-ring-size=4096" : "",
>> -                                 machine_opts ? " -machine " : "",
>> -                                 machine_opts ? machine_opts : "",
>> -                                 memory_size, tmpfs, uri,
>> +                                 cmd_common->str, tmpfs, uri,
>>                                    arch_target, shmem_opts,
>>                                    args->opts_target ? 
>> args->opts_target : "",
>>                                    ignore_stderr);
> 

