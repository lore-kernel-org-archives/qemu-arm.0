Received: by 2002:a17:906:9417:b0:98e:baa:bd63 with SMTP id q23csp1857454ejx;
        Wed, 28 Jun 2023 01:42:52 -0700 (PDT)
X-Received: by 2002:a2e:81c6:0:b0:2b6:b779:c68 with SMTP id s6-20020a2e81c6000000b002b6b7790c68mr2387677ljg.15.1687941772372;
        Wed, 28 Jun 2023 01:42:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1687941772; cv=none;
        d=google.com; s=arc-20160816;
        b=jluQbxENZRhYgqUZ6z5tcS5cQ/4WwPzJE75rNdiTyeRbA5JxPHb0caW6vrj0ffmAOq
         UfZ1WUtXeJWt3v9kkIrWq943azDUvewZQGgx/K+yUjD0Sy+JxxmIU2VhhafMkMge/rjQ
         D4mVtpGH7Yon+HlbHxkemTOoA/hrMXX+1s5TaK2F8TmiiF6fLqO4t7CTwBK1j4JcoNGB
         efZSbLuvpxYtp3GksjN78JhcSziKozBogezVEDLM3Es4az2MNCjpeYL8SLZEU4aAw/fY
         7K0mbPFDFrhBy6vXSWAC2veIId/KWAR+moIy3QGlmKLkM9CIGAoFjnN5Wz5dTPbe9Ymd
         X1fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=FIMYxIjfgrJTa4Sr5WYwWDlTONw1iuSwOUaxogh89fI=;
        fh=b+t/FAgjZ7G5k2Av0DENm9ClElwuldlNUYmeE5L1xxU=;
        b=YeP2MC8nCY0zUUO2fFL6R7lhtzCNdzLsLGI20Cm4jJjxJ0IR+UVRpwJ6G++1r12Wme
         zvlYGUW8OVVwgHekS05rU72kKj4AK3lStyB59Ee6ImUJxbahLRvXLSnuXipzWCjZzZPz
         4rj22nfuetRS/52zUZx5gF3cfriLkzKXnYaW0UwmDz/Cm5iG9vrXlIjclz0kybqBTmux
         ie4lWtE/xvUAjHpRyek5seP6HbmKk3v/7jCOAaWvzbv57wSV7V+0Cve/iqSUkmH7qi3o
         OemiyTkraJauURbZLn5GOzBS0IlVTMqTHGLtBZA2jx9TFtlwcm0ZOAZIY0mkKPqsk+WT
         9YSA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=PvQjEHW1;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id s3-20020a05651c200300b002b6a6f690c5sor1991007ljo.1.2023.06.28.01.42.52
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 28 Jun 2023 01:42:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=PvQjEHW1;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687941772; x=1690533772;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FIMYxIjfgrJTa4Sr5WYwWDlTONw1iuSwOUaxogh89fI=;
        b=PvQjEHW12dQYdIrIyKByCVrugYlqvHXSlynYIqA5si7Ix3pU0hBammuMRio9jnu1R9
         H81u6/cPTZfmaEL7WzEMo3VGRIZZEl1BcQYItEC3wwMaec4x2cDcjquA9ChpGgu7/+be
         XJ9y0OIF9DT4tHJtDfFduWBCio30GJje22xDBr9I/15SHBAKX8WXzjmk+tjtbcYoq75r
         ungXt9I/TSYQ4I21yr4iLQb4s9Kdmr7KFrgaYXr8Zn6ZfRcGbhlIaW9UeGQP8U6fiIbF
         4kNVW32FbvtJc6zT/E7PKlaWTXN7968Aj8JuWAQuhQjIC047vc6c9rTfmnKXIluot5GH
         +B2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687941772; x=1690533772;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FIMYxIjfgrJTa4Sr5WYwWDlTONw1iuSwOUaxogh89fI=;
        b=Fl0ID2ASNyE0CBQZFjJ/EYKUFI4rpSMv/CuaWXqC+/+25vAVUAMHOeSRN77YbvYR2i
         kcVrQzRjPwBvgTEGZhrPpkANmrNmmYhTViAO9iLctR7Ac7f9L9hGqUEw8rEWbEsHvjQl
         qzOKMKHaUgJguAqJJP/FzqfHz0h2PJUMKDQU+o7EIZyappDLQnucifN9x9bZwyTfSv7J
         OdNQ8/P5ZB3ISLsphDEAh9iRy5gSHZfAIqV6AxgHNQCkAEIpHAK8T54seAkX4KKMUHzQ
         x1/K8Ni8WXxvVybepWF3h2ZKpcM0ZocT5dfxrKGf9O9MKRaFcgWWc3wzMWZy5R0+quJn
         GUng==
X-Gm-Message-State: AC+VfDwvNT7hZCGLvxU/y0wu+6r3YYDHjIDLBjBRyKgBNHCM0UoPcUNH
	ltbprB4qcDxP/oPM+zb28emZEmAYSME6RBO+QB/BOPRP3ec=
X-Google-Smtp-Source: ACHHUZ7/xU90SYDSgotyG0ljoYcC3VK0BeCu+UI1CBhuuo2T1+zV3t3/UmIYF6m9eWsIGHcQKWGDBw==
X-Received: by 2002:a05:651c:109:b0:2b4:78f6:d330 with SMTP id a9-20020a05651c010900b002b478f6d330mr18685318ljb.2.1687941771826;
        Wed, 28 Jun 2023 01:42:51 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.1.208] ([139.47.41.103])
        by smtp.gmail.com with ESMTPSA id h2-20020a1ccc02000000b003fa74bff02asm12994082wmb.26.2023.06.28.01.42.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Jun 2023 01:42:51 -0700 (PDT)
Message-ID: <7658f042-15d1-7d4f-f316-756b2a299dee@linaro.org>
Date: Wed, 28 Jun 2023 10:42:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v3 28/36] gdbstub: clean-up vcont handling to avoid goto
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Juan Quintela <quintela@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, Leonardo Bras <leobras@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Bin Meng <bmeng.cn@gmail.com>, Yanan Wang <wangyanan55@huawei.com>,
 Darren Kenny <darren.kenny@oracle.com>, Alexander Bulekov <alxndr@bu.edu>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, Peter Xu <peterx@redhat.com>,
 Radoslaw Biernacki <rad@semihalf.com>, Laurent Vivier <laurent@vivier.eu>,
 Paolo Bonzini <pbonzini@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 qemu-arm@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>,
 Bandan Das <bsd@redhat.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philmd@linaro.org>, =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?=
 <berrange@redhat.com>, Alexandre Iooss <erdnaxe@crans.org>,
 Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
 Leif Lindholm <quic_llindhol@quicinc.com>,
 Laurent Vivier <lvivier@redhat.com>, Qiuhao Li <Qiuhao.Li@outlook.com>,
 Mahmoud Mandour <ma.mandourr@gmail.com>, Riku Voipio <riku.voipio@iki.fi>
References: <20230627160943.2956928-1-alex.bennee@linaro.org>
 <20230627160943.2956928-29-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230627160943.2956928-29-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: WXNorJ5VteyR

On 6/27/23 18:09, Alex Bennée wrote:
> We can handle all the error exit cases by using g_autofree() for the
> one thing that needs cleaning up on the exit.
> 
> Signed-off-by: Alex Bennée<alex.bennee@linaro.org>
> Reviewed-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   gdbstub/gdbstub.c | 28 +++++++++-------------------
>   1 file changed, 9 insertions(+), 19 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
