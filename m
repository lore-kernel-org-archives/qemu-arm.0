Received: by 2002:a17:504:8616:b0:1be9:327d:8ee3 with SMTP id o22csp35189njm;
        Mon, 28 Apr 2025 22:37:01 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCW9nnK7ldOhF8miW6Jyzfv9szkNt6KZHocf5LiX+ZWQcAskaO8p0NNXjnY/kfVyYYIX3CoCnmRLgDSQtQ==@linaro.org
X-Received: by 2002:a5d:5b87:0:b0:38f:503a:d93f with SMTP id ffacd0b85a97d-3a08949ff00mr1565793f8f.40.1745905021280;
        Mon, 28 Apr 2025 22:37:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1745905021; cv=none;
        d=google.com; s=arc-20240605;
        b=MsHPLH/JZnHyWYBCc8JHSUhYbShNuIzlO8S5sQhePczRrxherp1Eml5AlFWgTeUT7Z
         6cVLRq2MoNmwLQbYvyMTa5+iJ+MgM/jZ2on6fqxKu7MOZXIHhREhhiZhN8cGzxanp++o
         vTjXRVgRq2UqGRUo74oDWGPgs6ruhQJkwdRRNRnYdOLu5CFBSlPZdMq4F3oDXfJblKcr
         obNhNGWMCjgQGRdKZlELk1WyQRKDmc+xfzz1lUb5TlrqsIpClrrtk8V5ZCH85Kyh3IpH
         ocsNsMY9UCy5hIYTtse0Y2lcF9qOMEYzjad0Y58PiM88w8oa3pM7WeXeLZbBWhACPcCG
         L5Cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=fdxbfOqh2DB6z+OvNYbD+2Iy/ee1tOeEB+GcS9VWkCY=;
        fh=Dvj4w63DKdEh/LRILZoK7ic7wF3QG/CyrP3j7yplSNw=;
        b=elhbRCyNvehbhyuTvXF2tQAxR5OAE8YTESTGcvhF9NXR8tzx7RCk8cbPiP01a0Ddvd
         1gs7tosSCM86C7ehsY/TTa834qR5KFh0MLIVxtMVpnxgshzLAcKWi7Ivr4qT7GdyXXR2
         wLGwADPGAt+Izh7ticQOSMM0Vbeg5iWbQn5nEfSB0MEXJpc0qs++ZEEdDLgRsHtoV21Q
         fS13Lp0cT4G/MaeqQMDy9nKlMnnuCjtfO9E5Aw6/gM6P7USL4/RpUzOhCz2PSM+wzc7P
         ISmVRM+ovj/jeoEDqCOmqywEVAag6dDOrAiZvsu2xBAkUjyqHHSUi5XdIBNSzkqia3aY
         25sg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=kvFcvo7R;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id ffacd0b85a97d-3a06d503327sor2928849f8f.5.2025.04.28.22.37.01
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 28 Apr 2025 22:37:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=kvFcvo7R;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745905021; x=1746509821; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fdxbfOqh2DB6z+OvNYbD+2Iy/ee1tOeEB+GcS9VWkCY=;
        b=kvFcvo7Rvjafdg0NyqZgo5/mvcWUfBKPtd97nxb9lniNF2NL4hcBLzjJLkBzfskCPT
         nqvu2uXD11j3P7jhhTSuB98LCZ51QU1Lt01RHenJDXhtrLb9bG14M5JkxZT/LMNjPPoS
         EM3vSsp1JuH5EGjPqEH256vGrEhBugBrhRQiv9aFxtB8Mkxr43yKYtJUcRfQWmAwvAFz
         e7SdOTFowApaTy9QVfKBMj0azfTQzUUkptL1hpqgMFXQiuaJcjVT7gG48StNvHjJKSwl
         873kx9CJ289nzoN/Xl5X00n2YP7ZlqsiZP3l8zWcCCJjzjZvNnDW5vM1oDDY0gras32Q
         lBIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745905021; x=1746509821;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fdxbfOqh2DB6z+OvNYbD+2Iy/ee1tOeEB+GcS9VWkCY=;
        b=UtzO5m1GZcktzR4x1X2B0LrVMBtSiXCN23SidK7O/LwW6uTMsIwkbp+4hU2qB23jwK
         l/RaIKoReHg+OtAlPWrJBKxTNZdJWF8yTQ2WpEwKefuKwKlpIaEnRIivsjDss4XX5ghU
         j6a1/UDdG72u56a1TAwxlV4cGEicII0TDEmnIOOCBSN2VaphA3HMl+t+0kmbmTzBhxKM
         byjWpoTt6zskYddjS9BtqW6/jkio4MEHeAlCmdNGm4EFln5X3FGhkmDrlqjX1tOjmX58
         Prq8Yzm9e4liU6wzWEVz97lCfI0l/jhPyML6UXsDkg7SHJ4Lqb/5d+O87GAgOfiPZ2zg
         ehRw==
X-Forwarded-Encrypted: i=1; AJvYcCWreJCx7TNZlfNWKqdvCzT82XSwdcUPSliKKS7FIlZgUArQh+cmdvHMJa0jWGMlQBRYe0TtLhvsCxGdHQ==@linaro.org
X-Gm-Message-State: AOJu0YxktSYCO/M8qe2uiaJ2wa58puzx4R8fJTt0S8D3jDiB/ULviJ4r
	ZW/9cO6cE2KFjvXsFCJCaWEpf9mn/pY5kIGDylkSgYI0Qn/WEc1jFgIaGNkJN8t+OA==
X-Gm-Gg: ASbGnct/8nvUnXIOnlDrU47Gc/m1kkPPxt/+s8TN0hN3eKrvGaJX4Zz7hpz2osMroo/
	4+Q+U2lTPBpCxtQZC0RCenWFUBpw7MOA1m+B4olCtKergp+9nzqIykzcbNxNWp9N4JcJ7VBwWot
	3RQPjBTMpKcFlbCjz/50aRT9i0f/NTw3N6Nl3br69BxyZ2WGehCsWBVez+s9Boi3v2i5C4ODt7g
	i53RTggoM+6HhVJMnPsn3fg6lSsPdbfHhFLvemkFq96U4sITpjj/lfqduAZaO0SKcB3Gf/oW+6+
	BZg5aQxq1tvYckIQ1QpJzI76ZxjpV8Zw8kWqgKwbWcYUSomgJnRblb1RviF3p7TmT7NNTxauJFR
	1qCx3dGIFDRVCXg==
X-Google-Smtp-Source: AGHT+IHPSQ2/orz4Fh9+TApHSPnuEOz7ugayFhhxAeqRVwe7oA6djQCIKIaw1NbnQJTqpfETcN8D4w==
X-Received: by 2002:a5d:5850:0:b0:39c:1257:dbab with SMTP id ffacd0b85a97d-3a0894a3d64mr1871645f8f.59.1745905020634;
        Mon, 28 Apr 2025 22:37:00 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from [192.168.69.169] (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a073e5d479sm13271027f8f.92.2025.04.28.22.36.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Apr 2025 22:36:59 -0700 (PDT)
Message-ID: <9aad9038-2154-4734-a110-7a4d432330a2@linaro.org>
Date: Tue, 29 Apr 2025 07:36:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/13] include/system/hvf: missing vaddr include
To: Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, kvm@vger.kernel.org,
 alex.bennee@linaro.org, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-arm@nongnu.org, anjo@rev.ng, richard.henderson@linaro.org
References: <20250429050010.971128-1-pierrick.bouvier@linaro.org>
 <20250429050010.971128-3-pierrick.bouvier@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250429050010.971128-3-pierrick.bouvier@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: pPNiLgQg+FS3

On 29/4/25 06:59, Pierrick Bouvier wrote:
> On MacOS x86_64:
> In file included from ../target/i386/hvf/x86_task.c:13:
> /Users/runner/work/qemu/qemu/include/system/hvf.h:42:5: error: unknown type name 'vaddr'
>      vaddr pc;
>      ^
> /Users/runner/work/qemu/qemu/include/system/hvf.h:43:5: error: unknown type name 'vaddr'
>      vaddr saved_insn;
>      ^
> /Users/runner/work/qemu/qemu/include/system/hvf.h:45:5: error: type name requires a specifier or qualifier
>      QTAILQ_ENTRY(hvf_sw_breakpoint) entry;
>      ^
> /Users/runner/work/qemu/qemu/include/system/hvf.h:45:18: error: a parameter list without types is only allowed in a function definition
>      QTAILQ_ENTRY(hvf_sw_breakpoint) entry;
>                   ^
> /Users/runner/work/qemu/qemu/include/system/hvf.h:45:36: error: expected ';' at end of declaration list
>      QTAILQ_ENTRY(hvf_sw_breakpoint) entry;
> 
> Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
> ---
>   include/system/hvf.h | 1 +
>   1 file changed, 1 insertion(+)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
