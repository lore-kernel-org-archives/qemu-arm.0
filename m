Received: by 2002:a17:505:3501:b0:1be9:327d:8ee3 with SMTP id mc1csp683894njb;
        Fri, 11 Oct 2024 15:52:22 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVbzwAPGSJxrc0QftdqZUkLXEy25fyTGZdsYAoEKYxhN6udXWzsO0+dwtyBJ964BTJc8hclg0hOuUkPyA==@linaro.org
X-Received: by 2002:a05:6512:130b:b0:52f:c5c0:2879 with SMTP id 2adb3069b0e04-539da5950e8mr2233158e87.41.1728687142434;
        Fri, 11 Oct 2024 15:52:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1728687142; cv=none;
        d=google.com; s=arc-20240605;
        b=BlOmiMQ+8cAJxoLHWrq31piIUJ31OIA1AZy+ASLJxHek6gXae5tdseQbW4l31XB963
         /FHSpQDi7v7SCe8tStiX8bBVnCCLqe5HtxUBJCf757SMEUV8NjP0aL47giviBhGbKlvs
         MqwuLRkjohxer8kr6U/cAXLieTx9iV52Eompstw9nm6IQIwa31jro5QCFqSOrdYr6JRy
         fqifdLDAep5rMRWwhtPJzMnOSjBS2N1Xmkb8OwhdUXkFaRfWzqNZUzr+wIRTp9YY1ZG/
         8AJXnmqDQCI1kDl9HwGMTYfgSgaxQjvOWtRiM2QwQdv+UVhGa3yRcOrM/vMPbmlb2Obh
         JY7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=dnzofjFPSUL3WKzP+FhJgxzB0pSOdKYfbeozcKbG5Lo=;
        fh=Xk+2koagkksVGPPAF+hLdPmQrhLL6IpT4gh9KK7RKGs=;
        b=VzKTfJqEK9AspMZm1r43XUlVacZudbuaECt0XOhlAgqNWwViP62BtjG+VK4EzcaRqV
         vFV77lhwktL87HIl7d8goIlTq9GQDdEZ0z1P0AxUCSeN7YR4V9lZdEa/mJdb4KXA31NE
         XnBvoG6Qa3JUh6D52FQrwVYhExS+o0xMzf+/9rreePiOfiJauR3itqLA8aiq7jZDrUA6
         9kLP3i0mT8CuQCyMCZf3bMObRrsyF1DuR3KCA3eT8fow3HBcZpRLqvopm/3+kg4OGn1c
         QVaB8dnT6Qu7NAGYrFfVHa16mL+qgTe4M6nPO4qtzbbnrKEvo29bZVdB65RzLscpIc+k
         h6yg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=m9sYQeDJ;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 2adb3069b0e04-539da5a0a72sor834958e87.26.2024.10.11.15.52.22
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 11 Oct 2024 15:52:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=m9sYQeDJ;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728687142; x=1729291942; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dnzofjFPSUL3WKzP+FhJgxzB0pSOdKYfbeozcKbG5Lo=;
        b=m9sYQeDJt6LzwAnphiFmhrpFqPzfgHCp4fpj0NGPeJNco1mDeekUj6OjsSOseYnqNt
         FhEWsrEq6gNvXPVsFNPguyyCVDxC/xnUm64LBNo0CetQYk3IBMcD0Lf2NnhfaAP+XjfG
         8VtTVZxbXdyfnopWt+DnM6GvuNkjt5dAIl6/+c6BquS8fPaAGVgK7Ov1d2mIYsahTY+3
         O9Oi9RhuZYSUGB0KH52A82UXcbZTEslmCw05rX2sgvREOh2rnZuldrUqd5NFODVPzz1B
         AH18f9yvWPaFaLgRqyorR15IUvk8+NOhI1yCZW7CrG+N74kYL1mv7e9QPTZB8wI9kakp
         o3IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728687142; x=1729291942;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dnzofjFPSUL3WKzP+FhJgxzB0pSOdKYfbeozcKbG5Lo=;
        b=w3DZuQenkhFQHGuqLhIAbJVOEbEpQIKejtSyL/d5RzW8/Ll3ly8zT0twOPj9AujdaM
         VcVYYrU+ZwTm3SILwbw7NP5OjMPmCe6D/iPvyV+mt9CLkyXlZdu4xUV0wLcAdb4eEVKd
         ZHCAnR60ER/TPkmZESs36/+LzIveQWz5dJs2+qjasRGFOMpwBfdGLiCUSmnZLuqhRcQt
         E+kqEzl8bUu/hnUiCoKBc1o9/JFPyaunTk6UrnYL93P6ljt1J3eXILq5QvuFkziW1h7F
         rKsaGYbZisfLu63q/YoaYkclpKYSGNAX8wt9YIC80Nh0pF0AygX9fkIEzJdj3n/KKaVX
         /JhA==
X-Forwarded-Encrypted: i=1; AJvYcCUyehvod8HTsSSRvDnh8ijQynVTxXMNCrBJ7dESCLe07IGToS1RvHn+CrxbFXRp1nwvLNZ37KxUEeeSOQ==@linaro.org
X-Gm-Message-State: AOJu0YyATqf9ML8r/q871LeGEIaFgM2NYeMNYxJnNo25gOLG8oxWBCg1
	fWn7HVHIv7uBGRzWS3DtMD7I9z++f8T7ij5VPRQNiP5J9wO6nPfCzp7lvH1FyYbTAw==
X-Google-Smtp-Source: AGHT+IGTg0S8j4FYojJFYVkX5vKBH9mqqx6AA/Eut0cgMrCG9vgLKGX6aYYOwZlWNCB4NeoGTdzDkA==
X-Received: by 2002:a05:651c:556:b0:2f3:f441:af24 with SMTP id 38308e7fff4ca-2fb32779b16mr18140581fa.26.1728687141791;
        Fri, 11 Oct 2024 15:52:21 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from [192.168.222.92] ([91.209.212.130])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2fb245b19f0sm6058001fa.71.2024.10.11.15.52.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Oct 2024 15:52:20 -0700 (PDT)
Message-ID: <ee2dcb64-1a4c-4b13-b0d9-83e1a58dbbcb@linaro.org>
Date: Fri, 11 Oct 2024 19:52:10 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 16/17] Revert "hw/sh4/r2d: Realize IDE controller before
 accessing it"
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
Cc: Guenter Roeck <linux@roeck-us.net>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Magnus Damm <magnus.damm@gmail.com>, qemu-arm@nongnu.org
References: <20241011131937.377223-1-thuth@redhat.com>
 <20241011131937.377223-17-thuth@redhat.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20241011131937.377223-17-thuth@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: Sk+bXCqApBR5

On 11/10/24 10:19, Thomas Huth wrote:
> This reverts commit 3c5f86a22686ef475a8259c0d8ee714f61c770c9.
> 
> Changing the order here caused a regression with the "tuxrun"
> kernels (from https://storage.tuxboot.com/20230331/) - ATA commands
> fail with a "ata1: lost interrupt (Status 0x58)" message.
> Apparently we need to wire the interrupt here first before
> realizing the device, so revert the change to the original
> behavior.
> 
> Reported-by: Guenter Roeck <linux@roeck-us.net>
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>   hw/sh4/r2d.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Acked-by: Philippe Mathieu-Daudé <philmd@linaro.org>

