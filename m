Received: by 2002:a5d:6790:0:0:0:0:0 with SMTP id v16csp3068756wru;
        Mon, 1 Jul 2019 14:15:21 -0700 (PDT)
X-Received: by 2002:adf:82b8:: with SMTP id 53mr4043481wrc.354.1562015721092;
        Mon, 01 Jul 2019 14:15:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1562015721; cv=none;
        d=google.com; s=arc-20160816;
        b=XH/JjeKdG04wtPfLWnj7j/YCInktGso366Qk7oLdHs6MnOGJrotPYy9Zk0KQ+yAqVa
         Lw95xJM3HKmcvutrE5DeCzLH/HP9XCnETYTOSIBNN/bt7Qe7yvhq3adO4l1Grds8F9hQ
         nSOCT3qXi8HGQdoJKvMWDZAuAL+e6sTmLoYKosEZnoycG3CjQx4B/7F/Q/+Cs+EchJRh
         U2+BF4D8GQ3AjP2X53NxMTPnBxWAWVMcyxCFIH2WHviFnTqCADwDf1L4CxisttHiHH2w
         Y7meD8RQLI30xKs0BfeVGyQzYpSzxD5QzTwzPFCg/qaucriWcB6R2Oz+peS+zr9DRxpK
         3Yvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:cc:to:subject;
        bh=We7df+jCm3xJqWt3qcPH7ou54aD4XsZ4I7ZDWEgdoPw=;
        b=NOH+v1DjPzffjI8ZJV2KY5vATBv+c5lim5hJPQzhj7/QTk6FWIFwRZGikiCUUXqSS4
         kPm68svSZvtzaAl7anaztx+kWLV9whE/ejCQhTH2KQIodIr6FVloaplrGhnP1KB1hG6Q
         zgcK5NWldY9YtQmeSyUbsE/2mxU+KQcUFJDHch0IHynWoFTBJ54mbR1f7W7hDIY/ufzU
         TgdRiTtPm8Mr4fc9M7elHVAxCe+yDPls7cVLmB7xb3AT+zbNQPkX5cvQfix1MnQdzvti
         GKxGUShq0ZcBTeFqLjIwkm8zle9TIqg/3hv7ZT5RdCCHmxU04rTeHBm+AvscFCKIOuGz
         M1ig==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of philmd@redhat.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id b202sor476169wmd.20.2019.07.01.14.15.21
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 01 Jul 2019 14:15:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of philmd@redhat.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=We7df+jCm3xJqWt3qcPH7ou54aD4XsZ4I7ZDWEgdoPw=;
        b=kbb/4q67vGJPdLQkEhZE8KWcWvt0vMqokYKLrzXdDIJUCC0Gg75kc27ChJ6YxxFoqB
         WTAGGzMjMeeXGczHqWqWh+xcHBwxmV0IOX6WFDJZW8bGTMOnZzCFVGag8V81lpVRSswP
         r197IEsJHDfR7r0sN3s/CLRUmNDpnMVhLQoyw9cpQ5X25J9SxW6hE54iWbZPGmYxm1Hm
         B1hP+Hzk7HGMhOtdbo/P7qpm13YoA3dgXSp5B50O9MNQvEmGcsHshHPn+rY7IG27kuPb
         eOKF/T5jJAXleGbzS2weq6tc4ebAFD2xETuEv+YV0TZtw2QmlY6Ypqpx1nOHGEliuVtz
         xD0w==
X-Gm-Message-State: APjAAAVhth30qKcNtT3h+18LfDNSxvtKekAI5CSotjYgFll1atLJzJsT
	fQRTV8kX/7cPXYel22dOiZ31Wi2j2K8=
X-Google-Smtp-Source: APXvYqxNUiYOpDQjPUGtr2/0f+sZw7nHrBHXUh1oDJF2ndwT5kkViaXQqsJogbtvy0t2GR6C1Ld2wQ==
X-Received: by 2002:a7b:c310:: with SMTP id k16mr596354wmj.133.1562015720656;
        Mon, 01 Jul 2019 14:15:20 -0700 (PDT)
Return-Path: <philmd@redhat.com>
Received: from [192.168.1.103] (183.red-88-21-202.staticip.rima-tde.net. [88.21.202.183])
        by smtp.gmail.com with ESMTPSA id h21sm876343wmb.47.2019.07.01.14.15.19
        (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
        Mon, 01 Jul 2019 14:15:20 -0700 (PDT)
Subject: Re: [Qemu-devel] [PATCH v3 00/27] Support disabling TCG on ARM
To: qemu-devel@nongnu.org
Cc: yang.zhong@intel.com, peter.maydell@linaro.org, drjones@redhat.com,
 sameo@linux.intel.com, robert.bradford@intel.com, qemu-arm@nongnu.org,
 pbonzini@redhat.com, alex.bennee@linaro.org
References: <156200651295.9862.9762213971590211209@c4a48874b076>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
 url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <d80d2840-51ca-bc24-5e79-ada9f7387553@redhat.com>
Date: Mon, 1 Jul 2019 23:15:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <156200651295.9862.9762213971590211209@c4a48874b076>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: dCrRMUsEVSOb

On 7/1/19 8:41 PM, no-reply@patchew.org wrote:
> Patchew URL: https://patchew.org/QEMU/20190701132516.26392-1-philmd@redhat.com/
> 
> This series failed build test on s390x host. Please find the details below.
> 
[...]
> In file included from /var/tmp/patchew-tester-tmp-n6pztn1n/src/hw/intc/armv7m_nvic.c:15:
> ---
>       |                       ^~~~~~~~~~~~
> In file included from /var/tmp/patchew-tester-tmp-n6pztn1n/src/include/hw/intc/armv7m_nvic.h:13,
>                  from /var/tmp/patchew-tester-tmp-n6pztn1n/src/hw/intc/armv7m_nvic.c:18:
> /var/tmp/patchew-tester-tmp-n6pztn1n/src/target/arm/cpu.h:3129:16: error: conflicting types for ‘ArchCPU’
>  3129 | typedef ARMCPU ArchCPU;
>       |                ^~~~~~~
> In file included from /var/tmp/patchew-tester-tmp-n6pztn1n/src/hw/intc/armv7m_nvic.c:15:
> ---
>       |                  ^~~~~~~
> In file included from /var/tmp/patchew-tester-tmp-n6pztn1n/src/include/hw/intc/armv7m_nvic.h:13,
>                  from /var/tmp/patchew-tester-tmp-n6pztn1n/src/hw/intc/armv7m_nvic.c:18:
> /var/tmp/patchew-tester-tmp-n6pztn1n/src/target/arm/cpu.h:3216:6: error: conflicting types for ‘cpu_get_tb_cpu_state’
>  3216 | void cpu_get_tb_cpu_state(CPUARMState *env, target_ulong *pc,
>       |      ^~~~~~~~~~~~~~~~~~~~
> In file included from /var/tmp/patchew-tester-tmp-n6pztn1n/src/hw/intc/armv7m_nvic.c:15:
> ---
> /var/tmp/patchew-tester-tmp-n6pztn1n/src/target/arm/helper.h:67: undefined reference to `helper_v7m_bxns'
> /usr/bin/ld: target/arm/translate.o: in function `gen_helper_v7m_vlstm':
> /var/tmp/patchew-tester-tmp-n6pztn1n/src/target/arm/helper.h:74: undefined reference to `helper_v7m_vlstm'
> collect2: error: ld returned 1 exit status
>   CC      arm-softmmu/hw/arm/vexpress.o
> make[1]: *** [Makefile:205: qemu-system-aarch64] Error 1
> make: *** [Makefile:472: subdir-aarch64-softmmu] Error 2
> ---
> /var/tmp/patchew-tester-tmp-n6pztn1n/src/target/arm/helper.h:67: undefined reference to `helper_v7m_bxns'
> /usr/bin/ld: target/arm/translate.o: in function `gen_helper_v7m_vlstm':
> /var/tmp/patchew-tester-tmp-n6pztn1n/src/target/arm/helper.h:74: undefined reference to `helper_v7m_vlstm'
> collect2: error: ld returned 1 exit status
> make[1]: *** [Makefile:205: qemu-system-arm] Error 1
> make: *** [Makefile:472: subdir-arm-softmmu] Error 2
> === OUTPUT END ===

Expected failure from the RFC patches.

I should have been smarter and split the series in 2, so only the 2nd
(RFC) would fail.
