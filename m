Received: by 2002:a17:504:4a21:b0:1be9:327d:8ee3 with SMTP id wq1csp9218njb;
        Tue, 22 Oct 2024 14:35:17 -0700 (PDT)
X-Received: by 2002:a17:903:189:b0:20c:9983:27ae with SMTP id d9443c01a7336-20fab2db44amr7336095ad.48.1729632917482;
        Tue, 22 Oct 2024 14:35:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1729632917; cv=none;
        d=google.com; s=arc-20240605;
        b=N9dqgJvA7RxyUwFyqmgddTNrQTP4TxZmX0bPWpTz7VSArxfhDxsiloaSv9AD5sB7KO
         sjbbxCg4AK4vqEUm9Nz1JMujixFLAjtxsAJ9vqArzFYMFlFdFAkNbOd9gEa9D3LDAljU
         hqBUqmrojbns5SpSVOveQrwtgtrstigUVA47tLYtze++q6BNsvHZMETd+WFnrD59+6/V
         wdwyc2lgOChiZvfw/ia+2fFU1KhpJamI+0U/ELdKrusjWYj/uAOOHvZAmkFi+UXvGnoi
         VD9+yMmPwZgScvkPU0KAh/GHemr4dNAQrBKtMfTnTa/oTMO2sJpYhGJU1xvwxfHkxwfw
         fKpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=vrjd+awV4p1X85NUzivqgfpDIpXkjLSWu5ANEGZU2Nc=;
        fh=Nww9TSlvSrZvOpHQt0LxodzM28RhQ/w3CsC046muh1c=;
        b=jERXbQjJ0S392PKTPUpqsk+5wqPDXxgB1Qh5SBf4DmWOnYbJ82UtlPxnKKecFMw93k
         f/Y1kBXUwjPYKNCN7fdOdN4/kC2pj4OOOppyDKJBAi3DHLaplapAxnDZHkvrdiu2U0fl
         KFYN/8PZal+XNVYFax5lOueGGN9dD7/i2JFIIQiMnGS8ClypuFRzNieiK76O1INITX24
         PrUV7Gm+2hUonMU3EWmWV3GyybJ1rqgIFOcKsOyCz9Clf7FM5ZRJZuzjFqFuN4PJiXPR
         rhBshXBWC93lwVtj992gAjUmSYzyUCO/cXKY6XrD/fkOo3A01egoLpVdwHPLGbaJ8jvN
         yQaQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=WjhJxJKH;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-20e991e17c6sor21571855ad.8.2024.10.22.14.35.17
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 22 Oct 2024 14:35:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=WjhJxJKH;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729632916; x=1730237716; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vrjd+awV4p1X85NUzivqgfpDIpXkjLSWu5ANEGZU2Nc=;
        b=WjhJxJKHfnBv66sTpnI9Xq9GyEGC4I4LQGlokEXHPGTPZUhiGxZlq3B5Es4mr1WT77
         m1bWJ0va/VIbkh5hfGgGGuf8sFFMjJjMkDN1C5exEwegqAoXOfHhOBDxE3G4rR6nbhtW
         4/WzaIYrm3QEp03/CfFjsPggCHukie3FspIPvG1JTPuiZwL01n0G+XK3E2Ck27iMTOX6
         xGXM5MmWYf22QpC/x4fv1XWrhYp/gH5J9/v8WK+OPTnroM5BWsXYFBC+xtYuWI7uXQhx
         zPlCBqGPeOwG6N4oX2nUAIcTTNF+I7Jh8hapON0u2qEjh9cYo6ZABRKOpGMqdBsmTtjW
         j1/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729632916; x=1730237716;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vrjd+awV4p1X85NUzivqgfpDIpXkjLSWu5ANEGZU2Nc=;
        b=Ow63rZa+S51yKntAQhkxAVYvc6qp+XYtg/UPpynZAXNmDFitZPUrsd9DMpOqvBw3zG
         kVHhvdmrf9NiZuRnIGCiJkN0iPRu6YkvcBPLkbCxtt0U/UXn5LYQ87L7tY5CRXzp3BB2
         5cLk80UGiFC320vpJF/2IjV/JWO3wrquEAbrzWN3Nx5ZejeSCq2BDTDE02MY79goWQ6X
         JrRoWh7NoKX+6OKQN3nQoDhwVo42ruBT9o8+Ez+GAgRU+pthzGKgHpOp11mQZ7I1F0Ps
         F5ES89cI/tpK+7rPi+RNA2qvIlooeYAgwYO9oeP0rBEADpo0Wkzh7/ipa5sRS5uVL6VJ
         ie0Q==
X-Gm-Message-State: AOJu0YzNUvqHAJXnBZd6esjipoeK/1f7bHoAENVOFNTKXHdnZb1pVVHS
	wBNSA/2TLjvF1CbIg/Tr+FoF4LTzOi+7oa4JXYjqhhtNccZfAUGwuKbsBBBv7b9prkciNk6PMzF
	muVc=
X-Google-Smtp-Source: AGHT+IHwvFEbSklJvPoqvUT2KermREbxK98wEJFbsYF3kmhEawq+YoepuIPGAXgjJxZwB3YiPbaqXg==
X-Received: by 2002:a17:90a:cf93:b0:2e2:c6b9:fd4a with SMTP id 98e67ed59e1d1-2e76b5fee60mr394865a91.18.1729632916590;
        Tue, 22 Oct 2024 14:35:16 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from [192.168.100.49] ([45.176.88.171])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e5ad4ee3b0sm6714339a91.42.2024.10.22.14.35.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Oct 2024 14:35:15 -0700 (PDT)
Message-ID: <361bd240-5203-4671-b201-e3814c8aef81@linaro.org>
Date: Tue, 22 Oct 2024 18:35:07 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 11/20] MAINTAINERS: mention my gdbstub/next tree
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Beraldo Leal <bleal@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Mahmoud Mandour <ma.mandourr@gmail.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Yanan Wang <wangyanan55@huawei.com>,
 Thomas Huth <thuth@redhat.com>, John Snow <jsnow@redhat.com>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 qemu-arm@nongnu.org, =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?=
 <berrange@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 devel@lists.libvirt.org, Cleber Rosa <crosa@redhat.com>,
 kvm@vger.kernel.org, Alexandre Iooss <erdnaxe@crans.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Riku Voipio <riku.voipio@iki.fi>, Zhao Liu <zhao1.liu@intel.com>,
 Marcelo Tosatti <mtosatti@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20241022105614.839199-1-alex.bennee@linaro.org>
 <20241022105614.839199-12-alex.bennee@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20241022105614.839199-12-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: aMEb9BfZolku

On 22/10/24 07:56, Alex Bennée wrote:
> Make it easy for people to see what is already queued.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   MAINTAINERS | 1 +
>   1 file changed, 1 insertion(+)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

