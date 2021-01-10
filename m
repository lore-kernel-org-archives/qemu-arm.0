Received: by 2002:ac2:4c03:0:0:0:0:0 with SMTP id t3csp1905664lfq;
        Sun, 10 Jan 2021 03:16:40 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyTjw1xkHcGdoar2N6HrVweDA1SH7LtlzUXhMXnpwXXBkjgwCDEfLVYdpOMGO0eXV129BHZ
X-Received: by 2002:a05:6902:20a:: with SMTP id j10mr17939288ybs.293.1610277399986;
        Sun, 10 Jan 2021 03:16:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1610277399; cv=none;
        d=google.com; s=arc-20160816;
        b=UhvAol/sQiB/mdmmCOwAV/+9uQAXd62uNh+5kR8SXIANpn8+H3X08eS9XDWqDHNm1j
         PUf6JAUq/M4CIqguwQWtWAUFae0Iqax9Bhg+DLT/exPKyPvWVMz3c0JF6hfvG5ob0MZM
         3SKEL/VOi9OhuQJhZ1L/pja+6xiZX9pTvn0qLfc7TMUhPTyI1IYz7Z3M2SevtRaVJNna
         7tVIX4dqBhkK/LiRVMDN6M9dvGxrqpAZEpubAWSmTGZdejMqC5MG0NClzCbocdG6g2uY
         IWVdYeLmswu/I59dL3wT9odlGSUGoRfXjKJgu6W0lLLdS/N9Z9vsEYJKNHpCR30tDv0/
         DvuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=GkDv4xfFHaW/8MrwXHnWCqtNS6/TPnwuCxBpZlEqsxs=;
        b=xlNF+Zk7JyU5j4Oc6BowB2aPAIp9VYyn5Xiwfzb9RaySfORMaD8hM1SMxVg++aiwTT
         139RmJlzWTwaEzcKxECk2Vmf0fb4fvRYWPM4ROyZfeX4d3xLxFTqRpGmzlwzsKS2qOuU
         VNCW6u4ZkJnk4LzeUjznJv2HwbeyTsWqQQKuvOfoWLXNnajWSUgJH5MxykOrRBmbZLnO
         +3GtQODCBRYKKBzm0tgbFiYfcFFOqpyTQ43stRUP5FZrOP6ML4frwnkSG3cYvr3lDMyi
         iY8bTcWhFotv1XaHvkvGQOXUFJGtEMtGh0Nuxxcwy/w9fDOR0+B0jhShfJBRjgKmYOj9
         fiew==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=QttRMd70;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y15si14451201ybb.170.2021.01.10.03.16.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 10 Jan 2021 03:16:39 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=QttRMd70;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:37216 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kyYi7-0001k3-Ao
	for alex.bennee@linaro.org; Sun, 10 Jan 2021 06:16:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38976)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kyYhM-0001jn-G1; Sun, 10 Jan 2021 06:15:52 -0500
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:35191)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kyYhL-0005Sl-0Y; Sun, 10 Jan 2021 06:15:52 -0500
Received: by mail-wr1-x42b.google.com with SMTP id r3so13418943wrt.2;
 Sun, 10 Jan 2021 03:15:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=GkDv4xfFHaW/8MrwXHnWCqtNS6/TPnwuCxBpZlEqsxs=;
 b=QttRMd70OYgLpkrnAiVDKsGNZP8XA7rmWeg37fZEq0zyO55hGUR0NAy5oe812w62z/
 zjQ0dzrK//JlwpZBmzdh7ELrIVxWMp0UXPd6+MENFw01KVtmrK/wZ2xfmxfOBNOifCc1
 jRblNDOn1D7VadBtneEy+Mvw9pANJSZQdvPKvIj/TbxTFF2Kn0K5fQwI/SiBMOqXcSnF
 EJSkwFaHVFpJF233Lg4tJodWWxJErz2OcK+JEabLHzmfD4OiVy8pa4hgisTAhC0VlDBh
 762DVLREXrn43FWiDwKp8740ptybxiJBwsZG+BW2fItIhAnwKvui+foepwjZdT4XISpZ
 xOTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=GkDv4xfFHaW/8MrwXHnWCqtNS6/TPnwuCxBpZlEqsxs=;
 b=OOL5oe9IsrNvtnFr5LYw32oErcp9RJ0cre4N/ZCPIfyhcZdUazqPTZd1TwoY8G5D/s
 XaKgFkfMwFopstD3OFwKYVWyip6bwXWC/0JHAVtx+53NiZADPTDqzmnxaLfMKi4mr8La
 sStmoyWqeIO9U0cI6La1av9HnZvNqaJq7qHioinvIbzy6R+86tmMQzljStE5HPgUItie
 VkyZqSXrax6dQ8wFQirr6tw7keg9o38Iq6RQXUF9mq/OTZKXyg9OeXPZuWm8pxxS7yTa
 7/C3Qwje+eY0DZJ4EqDGPOD+cn1hGrAoJjVItM/IVu81gngEdBDLmWv4ta4ZrgMHYGQ+
 JEBQ==
X-Gm-Message-State: AOAM531A4YQDDkvN1AYoPfzdjow8IxkBX9nJJ5KMPWgezwel27MKjUGX
 zSEhRkhMl/ZD1le95qecRd0=
X-Received: by 2002:a5d:530c:: with SMTP id e12mr11769905wrv.54.1610277348984; 
 Sun, 10 Jan 2021 03:15:48 -0800 (PST)
Received: from [192.168.1.36] (129.red-88-21-205.staticip.rima-tde.net.
 [88.21.205.129])
 by smtp.gmail.com with ESMTPSA id c7sm22418489wro.16.2021.01.10.03.15.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 10 Jan 2021 03:15:48 -0800 (PST)
Subject: Re: [PATCH v4 2/6] hw/ssi: imx_spi: Remove imx_spi_update_irq() in
 imx_spi_reset()
To: Bin Meng <bmeng.cn@gmail.com>, Peter Maydell <peter.maydell@linaro.org>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Alistair Francis <alistair.francis@wdc.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210110081429.10126-1-bmeng.cn@gmail.com>
 <20210110081429.10126-3-bmeng.cn@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <40b62e4a-6139-7427-77bc-b33436687f92@amsat.org>
Date: Sun, 10 Jan 2021 12:15:46 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210110081429.10126-3-bmeng.cn@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.255,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Bin Meng <bin.meng@windriver.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ONrbYWhtdiaZ

On 1/10/21 9:14 AM, Bin Meng wrote:
> From: Bin Meng <bin.meng@windriver.com>
> 
> Usually the approach is that the device on the other end of the line
> is going to reset its state anyway, so there's no need to actively
> signal an irq line change during the reset hook.
> 
> Move imx_spi_update_irq() out of imx_spi_reset(), to a new function
> imx_spi_hard_reset() that is called when the controller is disabled.
> 
> Signed-off-by: Bin Meng <bin.meng@windriver.com>
> 
> ---
> 
> Changes in v4:
> - adujst the patch 2,3 order
> - rename imx_spi_soft_reset() to imx_spi_hard_reset() to avoid confusion
> 
> Changes in v3:
> - new patch: remove imx_spi_update_irq() in imx_spi_reset()
> 
>  hw/ssi/imx_spi.c | 14 ++++++++++----
>  1 file changed, 10 insertions(+), 4 deletions(-)
> 
> diff --git a/hw/ssi/imx_spi.c b/hw/ssi/imx_spi.c
> index e605049a21..2c4c5ec1b8 100644
> --- a/hw/ssi/imx_spi.c
> +++ b/hw/ssi/imx_spi.c
> @@ -241,11 +241,16 @@ static void imx_spi_reset(DeviceState *dev)
>      imx_spi_rxfifo_reset(s);
>      imx_spi_txfifo_reset(s);
>  
> -    imx_spi_update_irq(s);
> -
>      s->burst_length = 0;
>  }
>  
> +static void imx_spi_hard_reset(IMXSPIState *s)
> +{
> +    imx_spi_reset(DEVICE(s));
> +
> +    imx_spi_update_irq(s);
> +}
> +
>  static uint64_t imx_spi_read(void *opaque, hwaddr offset, unsigned size)
>  {
>      uint32_t value = 0;
> @@ -351,8 +356,9 @@ static void imx_spi_write(void *opaque, hwaddr offset, uint64_t value,
>          s->regs[ECSPI_CONREG] = value;
>  
>          if (!imx_spi_is_enabled(s)) {
> -            /* device is disabled, so this is a reset */
> -            imx_spi_reset(DEVICE(s));
> +            /* device is disabled, so this is a hard reset */
> +            imx_spi_hard_reset(s);
> +
>              return;
>          }
>  

Almost good :)

DeviceReset handler is a hard reset, so you need:

  dc->reset = imx_spi_hard_reset;

Thus you also need this function prototype:

void imx_spi_hard_reset(DeviceState *dev)

Eventually renaming imx_spi_reset() -> imx_spi_soft_reset()
will make things even easier.

Regards,

Phil.
