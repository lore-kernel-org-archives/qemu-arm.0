Received: by 10.25.150.194 with SMTP id y185csp919082lfd;
        Thu, 10 Nov 2016 09:35:48 -0800 (PST)
X-Received: by 10.28.230.197 with SMTP id e66mr6966788wmi.12.1478799348127;
        Thu, 10 Nov 2016 09:35:48 -0800 (PST)
Return-Path: <rth7680@gmail.com>
Received: from mail-wm0-x243.google.com (mail-wm0-x243.google.com. [2a00:1450:400c:c09::243])
        by mx.google.com with ESMTPS id m1si6353961wjt.59.2016.11.10.09.35.48
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 10 Nov 2016 09:35:48 -0800 (PST)
Received-SPF: pass (google.com: domain of rth7680@gmail.com designates 2a00:1450:400c:c09::243 as permitted sender) client-ip=2a00:1450:400c:c09::243;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com;
       spf=pass (google.com: domain of rth7680@gmail.com designates 2a00:1450:400c:c09::243 as permitted sender) smtp.mailfrom=rth7680@gmail.com
Received: by mail-wm0-x243.google.com with SMTP id u144so4509930wmu.0;
        Thu, 10 Nov 2016 09:35:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=sender:subject:to:references:cc:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding;
        bh=GTtqZyz/e3u/VnlNhzzc1uQgUcnG6zGr/aldx8BG+Oc=;
        b=UeBGjdBK15I1SnwO5ZpcF9qcfwaKYQxCMXLlSHymLIiWsV/7EeBIc9VQj4mNFTGUBN
         driNc1JG/yUW4fXuAkzJS18YIbhwhn3hsNfJLSy93qgIMn+TbmEEh/ovNMjEEhM92sYY
         tv8h3IrkYxwrQ5Bu8ojdye5fhyThXnSjh4PFApSqM7lvAe669RDIXAw/V0++V4tccRYA
         F4oJeo39ar0rhQB2ygi6O2EgZ0osvP6PlcKqUbFU4yiJWWnLfoLVkxlWWq2H4r5eaIgN
         FVOB74r7h7CcGhTAvguK8Tl50kDXGJkjoZ11CZHGEo/cDzHkF33/2LrmYutnExcuoMZi
         W58A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20130820;
        h=x-gm-message-state:sender:subject:to:references:cc:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-transfer-encoding;
        bh=GTtqZyz/e3u/VnlNhzzc1uQgUcnG6zGr/aldx8BG+Oc=;
        b=k2Ie9izt9C7zMSj6gctiuKcBURbfzwq6xHrxBweJZAmoaIWieagG7PpCKOMdaM2zdU
         6dGdZbeqfcbVktPHJxQnaQVBHM1O0hPFKLff3YCu0fJhN3isVetn1lbNOLnfLr17OOoN
         9Azlhoa0rzY9gZc4CnGWzVp55uruEhE9hJEu5niJ216/i63ASEGcSK4ajss/Bgpaw4eu
         uwjgLZlhzIAcAmLk02rq9r7boTEDR/uD2ADEDAHly00SP3BG2TNh+o0RsBy+I/QoLCHW
         acFGjGxHHcG5jHYDNeZKGe7eVJWnQ+yCLxNZU7YvixsrvJd4khvAwTnPATAPtp62ajRy
         5xIA==
X-Gm-Message-State: ABUngvfDM+ZNmEA0ACVhoKziVQv0sS7vX8W1FzW+XisMuY/wnUm33QmVSHTIV4Ybf3sAlA==
X-Received: by 10.28.88.18 with SMTP id m18mr7434286wmb.26.1478799347769;
        Thu, 10 Nov 2016 09:35:47 -0800 (PST)
Return-Path: <rth7680@gmail.com>
Received: from bigtime.twiddle.net ([87.111.149.139])
        by smtp.googlemail.com with ESMTPSA id di9sm6590982wjc.37.2016.11.10.09.35.42
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 10 Nov 2016 09:35:47 -0800 (PST)
Sender: Richard Henderson <rth7680@gmail.com>
Subject: Re: [PATCH v6 14/19] target-arm/powerctl: defer cpu reset work to CPU
 context
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>, pbonzini@redhat.com
References: <20161109145748.27282-1-alex.bennee@linaro.org>
 <20161109145748.27282-15-alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, mttcg@greensocs.com, fred.konrad@greensocs.com,
 a.rigo@virtualopensystems.com, cota@braap.org, bobby.prani@gmail.com,
 nikunj@linux.vnet.ibm.com, mark.burton@greensocs.com,
 jan.kiszka@siemens.com, serge.fdrv@gmail.com, peter.maydell@linaro.org,
 claudio.fontana@huawei.com, "open list:ARM" <qemu-arm@nongnu.org>
From: Richard Henderson <rth@twiddle.net>
Message-ID: <07d61168-e2cc-f5ca-ed01-600774d5db3e@twiddle.net>
Date: Thu, 10 Nov 2016 18:35:39 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <20161109145748.27282-15-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: VL52ozCgIbW/

On 11/09/2016 03:57 PM, Alex Bennée wrote:
> +        /* We are requested to boot in AArch32 mode */
> +        static uint32_t mode_for_el[] = { 0,
> +                                          ARM_CPU_MODE_SVC,
> +                                          ARM_CPU_MODE_HYP,
> +                                          ARM_CPU_MODE_SVC };

I know you're just moving most of this code, but, const.

Otherwise,

Reviewed-by: Richard Henderson <rth@twiddle.net>


r~
