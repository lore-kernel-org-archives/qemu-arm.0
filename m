Received: by 2002:a19:e20e:0:0:0:0:0 with SMTP id z14csp1938931lfg;
        Sun, 2 May 2021 09:15:44 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzn1Nsb5tYrkQ4/Cmp5j6NCRVWDD4EDN7L7LpqoC3KW7Dyoyp18Ho/th6gaTCLMyWJOJ4mi
X-Received: by 2002:ab0:310a:: with SMTP id e10mr12015457ual.93.1619972144711;
        Sun, 02 May 2021 09:15:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1619972144; cv=none;
        d=google.com; s=arc-20160816;
        b=a4g3WBeE/MpZQT2ePq02F20L4jJ5J4f2pD/ij8kCOXEtW2map9WaLIb0WDIkyf3k2A
         HFqztXY/Yp2+YFZdiadlWafmWMtys0K7tTtH4KcUmJ3V8QBAPP5mCIE0cspMdVl9GnUg
         Yy5Z94WF5Z8QpWcrFKkHBUraG2/Y8Tpler+1MUcUUtmJMOVNkb5plg4/Uj06IWDgfPE4
         tmr3B9jvTmlldk2Vr0f3HpsaLgYDIZBmIMM7nAA7I38If6TzTCei2kL5Pr8h9su7kdDY
         uEQfmFN04XlpAf0AHxKGmShWuL2BqcSaZ//7+AKMevAT494ZEcU51Uy+Yz/ZBjK4vO7f
         CInQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=FRVQrMS7afs5e0oAOlyyTEGPnGAgHSq9IdcRfAMAO4U=;
        b=0nIK4Z/g53f9YFXuOsw1bhiV/hlOdtdBPHQU7WCW4TN27Q17iBJOFbxFfJnn0M4OWa
         EEADa5rkzDcJvvJZlISQ7/Jjt1OP5U9VMvzECHEqFZc6tZw3HwtK0+QL5H2+8SfQ7DdD
         cHSmrySrojzT28hBTqqR6WNenV8PRPpE/cQoAegLICSmgwgANDPXLMX6H5PW/tUSpFqz
         7+p9SF+/35IUNWuJupWGzxOUnfka7npb8xa0sLqUIlxbAAj8DmD3FMhdhn/L7Ra5Dvt4
         kWdhJXr7mpdlJjLvlgdbS4U5yi0AwCJBPaV0akclVikM9m6WmVwMjvCyxxWxSPrNz7XV
         zUpg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=RZqon3mD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t11si3025181vsa.113.2021.05.02.09.15.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 02 May 2021 09:15:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=RZqon3mD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:44606 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ldEkv-0004c7-VQ
	for alex.bennee@linaro.org; Sun, 02 May 2021 12:15:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35692)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groeck7@gmail.com>)
 id 1ldEje-0002z6-O6; Sun, 02 May 2021 12:14:23 -0400
Received: from mail-oo1-xc29.google.com ([2607:f8b0:4864:20::c29]:46884)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <groeck7@gmail.com>)
 id 1ldEjc-0006kX-Vy; Sun, 02 May 2021 12:14:22 -0400
Received: by mail-oo1-xc29.google.com with SMTP id
 v14-20020a4ae6ce0000b02901fe68cd377fso48798oot.13; 
 Sun, 02 May 2021 09:14:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=FRVQrMS7afs5e0oAOlyyTEGPnGAgHSq9IdcRfAMAO4U=;
 b=RZqon3mD+HQGlgUMAoWYViMdZ96LF4qRqI2yoDOqEmn0m5RIwD8RzbDrgl6SdGQK8C
 F9ARpGv+Te01IvR5OjwQcK0HSdJluVbLWnC4q4isEYqbYeCwE+06nXKpjlrbNCB/qmjT
 6c+wDqId1OTNwR2lq8oq9MquPUqxl2Ke9ZCC8JgaVVndib/o4n+AGDoSUH9tOWrWBzLI
 QM1SD6l8ll7urFMMxDEK8vOOHOpzQ7LP8qhYLdEvDpnQ0lakai1nC9405yaRfU51GEQ/
 mmNyKDOSEU+dgPeqk6RaYYH0I0mV4D9WCBhVbAJqANj0hwB2hduWI2I5YwhwDhtBUZrr
 SJSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=FRVQrMS7afs5e0oAOlyyTEGPnGAgHSq9IdcRfAMAO4U=;
 b=kJQCrtD97dYJ+TRDHM3u7ePXBNmLW1OMxuir4zOJCMjUBsYncRggZfPC/j9J4lrdsI
 5bLXz9Coy+WcXvdA+umPcJP/GI98Tk1+MEGN2pSh/NgfQRKJdWgVfGWLtrmljIOC0pwD
 cXmqmbNDpt7p3zdTMeKBbDx9se7/00Srk76ZThICCIc9MEMEEMBQwbtwhc6dfzEtXx0B
 nh6N4d8rL0kunY3QexohfF37Jd9KvwHTJErEiCm2bgeTMxcVpYngIbPRPj6FwV5o0tIW
 wmPdNNdmHfmeYjr3l+LSpl4ITfBA1ANsnBP0yvOhQYEAEqhOVuVTTrrG/pDVAUmXoW0P
 hKmw==
X-Gm-Message-State: AOAM532fleBvNIxdG/7TMOh/63BBDqd78zCko1wGNGLvKBXCENiDP6+Z
 B+fQ/uNd5nzlbpfpP5xaUuo=
X-Received: by 2002:a4a:1703:: with SMTP id 3mr9917269ooe.92.1619972059404;
 Sun, 02 May 2021 09:14:19 -0700 (PDT)
Received: from server.roeck-us.net
 (108-223-40-66.lightspeed.sntcca.sbcglobal.net. [108.223.40.66])
 by smtp.gmail.com with ESMTPSA id x24sm2266276otk.16.2021.05.02.09.14.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 02 May 2021 09:14:19 -0700 (PDT)
Subject: Re: [PATCH] hw/net/imx_fec: return 0xffff when accessing non-existing
 PHY
To: Bin Meng <bmeng.cn@gmail.com>
References: <20210502160326.1196252-1-linux@roeck-us.net>
 <CAEUhbmWC_jVkrF9V=rs+A2A021ahqefimFtehsxgfvTxphwKZQ@mail.gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <bffabe57-013a-1aca-e854-38a211738049@roeck-us.net>
Date: Sun, 2 May 2021 09:14:17 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <CAEUhbmWC_jVkrF9V=rs+A2A021ahqefimFtehsxgfvTxphwKZQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c29;
 envelope-from=groeck7@gmail.com; helo=mail-oo1-xc29.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_ENVFROM_END_DIGIT=0.25,
 FREEMAIL_FORGED_FROMDOMAIN=0.248, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, Jason Wang <jasowang@redhat.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Jean-Christophe Dubois <jcd@tribudubois.net>, qemu-arm <qemu-arm@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: OnI9kC8bhsLL

On 5/2/21 9:09 AM, Bin Meng wrote:
> On Mon, May 3, 2021 at 12:03 AM Guenter Roeck <linux@roeck-us.net> wrote:
>>
>> If a PHY does not exist, attempts to read from it should return 0xffff.
>> Otherwise the Linux kernel will believe that a PHY is there and select
>> the non-existing PHY. This in turn will result in network errors later
>> on since the real PHY is not selected or configured.
>>
>> Since reading from or writing to a non-existing PHY is not an emulation
>> error, replace guest error messages with traces.
>>
>> Fixes: 461c51ad4275 ("Add a phy-num property to the i.MX FEC emulator")
>> Cc: Jean-Christophe Dubois <jcd@tribudubois.net>
>> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
>> ---
>>  hw/net/imx_fec.c    | 8 +++-----
>>  hw/net/trace-events | 2 ++
>>  2 files changed, 5 insertions(+), 5 deletions(-)
>>
>> diff --git a/hw/net/imx_fec.c b/hw/net/imx_fec.c
>> index f03450c028..9c7035bc94 100644
>> --- a/hw/net/imx_fec.c
>> +++ b/hw/net/imx_fec.c
>> @@ -283,9 +283,8 @@ static uint32_t imx_phy_read(IMXFECState *s, int reg)
>>      uint32_t phy = reg / 32;
>>
>>      if (phy != s->phy_num) {
>> -        qemu_log_mask(LOG_GUEST_ERROR, "[%s.phy]%s: Bad phy num %u\n",
>> -                      TYPE_IMX_FEC, __func__, phy);
>> -        return 0;
>> +        trace_imx_phy_read_num(phy, s->phy_num);
>> +        return 0xffff;
>>      }
>>
>>      reg %= 32;
>> @@ -345,8 +344,7 @@ static void imx_phy_write(IMXFECState *s, int reg, uint32_t val)
>>      uint32_t phy = reg / 32;
>>
>>      if (phy != s->phy_num) {
>> -        qemu_log_mask(LOG_GUEST_ERROR, "[%s.phy]%s: Bad phy num %u\n",
>> -                      TYPE_IMX_FEC, __func__, phy);
>> +        trace_imx_phy_write_num(phy, s->phy_num);
>>          return;
>>      }
>>
>> diff --git a/hw/net/trace-events b/hw/net/trace-events
>> index baf25ffa7e..ee77238d9e 100644
>> --- a/hw/net/trace-events
>> +++ b/hw/net/trace-events
>> @@ -413,8 +413,10 @@ i82596_set_multicast(uint16_t count) "Added %d multicast entries"
>>  i82596_channel_attention(void *s) "%p: Received CHANNEL ATTENTION"
>>
>>  # imx_fec.c
>> +imx_phy_read_num(int phy, int configured) "read request from unconfigured phy %d (configured %d)"
> 
> nits: could we put this below imx_phy_read(), like you put
> imx_phy_write_num after imx_phy_write?
> 

Sure, makes sense. I'll wait a bit for other feedback and then resend.

>>  imx_phy_read(uint32_t val, int phy, int reg) "0x%04"PRIx32" <= phy[%d].reg[%d]"
>>  imx_phy_write(uint32_t val, int phy, int reg) "0x%04"PRIx32" => phy[%d].reg[%d]"
>> +imx_phy_write_num(int phy, int configured) "write request to unconfigured phy %d (configured %d)"
>>  imx_phy_update_link(const char *s) "%s"
>>  imx_phy_reset(void) ""
>>  imx_fec_read_bd(uint64_t addr, int flags, int len, int data) "tx_bd 0x%"PRIx64" flags 0x%04x len %d data 0x%08x"
>> --
> 
> Otherwise,
> Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
> Tested-by: Bin Meng <bmeng.cn@gmail.com>
> 

Thanks!

Guenter
