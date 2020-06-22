Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp2972620lfm;
        Mon, 22 Jun 2020 01:28:49 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzd1KnLTjfxfBto0FtdLafspp0ePEti+gYHfXvSATi8qRwviq+vXXl0pVbLNRaYeyXQi4W6
X-Received: by 2002:a25:9c45:: with SMTP id x5mr24042609ybo.107.1592814529249;
        Mon, 22 Jun 2020 01:28:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1592814529; cv=none;
        d=google.com; s=arc-20160816;
        b=SPe21XwOK7gXHL/SoDW/K+Ai1BfvLhLzJPD53LBSR190sALZcbHm6YjyImo1xcmnRd
         Q+VsoOhZ0uCrCmPNqX9A3MYFpsfmmjpqBYLVnyTtywBIHwiXoEeDpIR6Wt2zuKFrPOPj
         jg2FovZ8qILRgg/J/BfpALBmsHVKnk98hKwG8AIKQdp6D2ehMqTYCm53D9L4O6w4DxJ6
         vp/OwhZaLvv74OmcYm+FmP14YdEVxExdJx4hFq1Qw1X5h4G8PS5MER5+GsV9JWzs8Sn3
         MRqemijIsQIDFHrq5c0fKiQ8t0DAPzmgJtYT9ZZn10POvz9yHnqHnZqNFyutz/f43tC1
         2Y1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=+E9tp1VJeuIN5sbjb0UuCumrm7v1XID67yYv227lfG4=;
        b=uFlRBA0jq0fd1gRJzem632GW4aCnTHumwa7WsXWtErJw0Qhig9Nns6WLk5LpPr7u35
         0PSn2rotLfd4OM49lcI6NW2AbnaJk6SApiqGhsQrkQr369YKo5iLJizdEwaL0HOUz+Ye
         uSr83Cveu/ch747f8lJL42L7Ru5Fat/kfCcdskYU3CdieAO7I7JfKzjPJfH7NNH/1SOs
         xFMR12EcpK+D73FoIHZZ5/F607d63ddMtC+V2n8+rgTcv5hnRS0ejhXyW571uoWguhd+
         QxncnujLLAc/14ZjDJQl/XPSkOMDndCZVgmWhBjbOjgML9r4F8nkDm/BdYW+FsJ7WvPh
         GaOg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=UnI1ctAx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s20si14337252ybc.436.2020.06.22.01.28.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 22 Jun 2020 01:28:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=UnI1ctAx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:38420 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jnHou-0005YK-Lh
	for alex.bennee@linaro.org; Mon, 22 Jun 2020 04:28:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33444)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jnHoY-0005Go-Sy; Mon, 22 Jun 2020 04:28:26 -0400
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343]:33207)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jnHoX-00007Z-CS; Mon, 22 Jun 2020 04:28:26 -0400
Received: by mail-wm1-x343.google.com with SMTP id a6so3971504wmm.0;
 Mon, 22 Jun 2020 01:28:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=+E9tp1VJeuIN5sbjb0UuCumrm7v1XID67yYv227lfG4=;
 b=UnI1ctAx3lsRDqnfmt9F89RMQZ606eTmnTSGVvE/5X9JBtYxtQJhJVxUgi+1GdjUPB
 ITrtOk48QHGQ9TA9BPm1EiHa8nkVmHvtFPJ+LLDOzPmXt7coduxmDdvu5/2V2NS4QeRc
 lOdGG/tYF1bMjnh5co2tN0n/09l/0fJXOUdTFQpcem5xvyqfuvoJ6bdHZYzAfhz9UHby
 L7qTS9/8XhqdayHcTT4ixQ1/a9WCMnbGh5ACfaV6QReHh0IZSEpGm++TqAJ2o7Zf/F1u
 vdC+4cUvQ7erSYJnlxCYwlOaT0stWcrY08qX9muJPaIKpldJ6fvUUF1+hNbVWrgjomhF
 Q/UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=+E9tp1VJeuIN5sbjb0UuCumrm7v1XID67yYv227lfG4=;
 b=f9pRmBL8Y4CeQPBFCHbEZ7iXPpKH62EeSv9iGvTVP2mliRcUfy2QP2Wi2b18e8HwBd
 TlvTWSDcSCHY35XhP6DwYmAw8avuCrpjJsXmfj0p3xASLSh4nOKU3G8/TK/h8gIjOSVa
 3myV2duvEYzv5YuvZ0iHrl2Y+JXyVOHo/l01J/9zKfqY22JmHP3JQvUkCflVECdfPLA5
 NtJN6m3I3Xd+8FqLShkaeajxkmXIdYKIPYaSCl878liLsNJ5NWUMTZdj+/GuYJCwhIBz
 1qOCrG27mIxZJdU8642EVcCv4RL2wEpEnaEZ8RBEfz+2S1h7jf3nvlDnjH3O6YtXQrCL
 pqjA==
X-Gm-Message-State: AOAM5322OEHNIVovl6ynOCAgz+CV8VRlMZYFukbgBnnpL5lQtAXAD/jg
 sgE4A56i4NHPbFnm7jcnNc0=
X-Received: by 2002:a05:600c:d5:: with SMTP id
 u21mr10897485wmm.156.1592814503319; 
 Mon, 22 Jun 2020 01:28:23 -0700 (PDT)
Received: from [192.168.1.39] (1.red-83-51-162.dynamicip.rima-tde.net.
 [83.51.162.1])
 by smtp.gmail.com with ESMTPSA id 125sm16581275wmc.23.2020.06.22.01.28.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Jun 2020 01:28:22 -0700 (PDT)
Subject: Re: [PATCH v4 1/8] hw/i2c/core: Add i2c_try_create_slave() and
 i2c_realize_and_unref()
To: qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>
References: <20200620225854.31160-1-f4bug@amsat.org>
 <20200620225854.31160-2-f4bug@amsat.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <7021f482-cf9b-8849-8688-4978efaf026e@amsat.org>
Date: Mon, 22 Jun 2020 10:28:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200620225854.31160-2-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::343;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x343.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: 0
X-Spam_score: 0.0
X-Spam_bar: /
X-Spam_report: (0.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=1, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Corey Minyard <cminyard@mvista.com>,
 Peter Maydell <peter.maydell@linaro.org>, Andrew Jeffery <andrew@aj.id.au>,
 qemu-arm@nongnu.org, Joel Stanley <joel@jms.id.au>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: //czmOhxGZkh

+Markus

On 6/21/20 12:58 AM, Philippe Mathieu-Daudé wrote:
> Extract i2c_try_create_slave() and i2c_realize_and_unref()
> from i2c_create_slave().
> We can now set properties on a I2CSlave before it is realized.
> 
> This is in line with the recent qdev/QOM changes merged
> in commit 6675a653d2e.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  include/hw/i2c/i2c.h |  2 ++
>  hw/i2c/core.c        | 18 ++++++++++++++++--
>  2 files changed, 18 insertions(+), 2 deletions(-)
> 
> diff --git a/include/hw/i2c/i2c.h b/include/hw/i2c/i2c.h
> index 4117211565..d6e3d85faf 100644
> --- a/include/hw/i2c/i2c.h
> +++ b/include/hw/i2c/i2c.h
> @@ -80,6 +80,8 @@ int i2c_send(I2CBus *bus, uint8_t data);
>  uint8_t i2c_recv(I2CBus *bus);
>  
>  DeviceState *i2c_create_slave(I2CBus *bus, const char *name, uint8_t addr);
> +DeviceState *i2c_try_create_slave(const char *name, uint8_t addr);
> +bool i2c_realize_and_unref(DeviceState *dev, I2CBus *bus, Error **errp);
>  
>  /* lm832x.c */
>  void lm832x_key_event(DeviceState *dev, int key, int state);
> diff --git a/hw/i2c/core.c b/hw/i2c/core.c
> index 1aac457a2a..acf34a12d6 100644
> --- a/hw/i2c/core.c
> +++ b/hw/i2c/core.c
> @@ -267,13 +267,27 @@ const VMStateDescription vmstate_i2c_slave = {
>      }
>  };
>  
> -DeviceState *i2c_create_slave(I2CBus *bus, const char *name, uint8_t addr)
> +DeviceState *i2c_try_create_slave(const char *name, uint8_t addr)
>  {
>      DeviceState *dev;
>  
>      dev = qdev_new(name);
>      qdev_prop_set_uint8(dev, "address", addr);
> -    qdev_realize_and_unref(dev, &bus->qbus, &error_fatal);
> +    return dev;
> +}
> +
> +bool i2c_realize_and_unref(DeviceState *dev, I2CBus *bus, Error **errp)
> +{
> +    return qdev_realize_and_unref(dev, &bus->qbus, errp);
> +}
> +
> +DeviceState *i2c_create_slave(I2CBus *bus, const char *name, uint8_t addr)
> +{
> +    DeviceState *dev;
> +
> +    dev = i2c_try_create_slave(name, addr);
> +    i2c_realize_and_unref(dev, bus, &error_fatal);
> +
>      return dev;
>  }
>  
> 
