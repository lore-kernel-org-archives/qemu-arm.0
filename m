Received: by 2002:a17:906:b2c6:b0:930:eaf4:5c09 with SMTP id cf6csp649712ejb;
        Fri, 31 Mar 2023 06:53:30 -0700 (PDT)
X-Google-Smtp-Source: AK7set9Bq54RDK2zImfODM7cntT8LQ5FstTgD6oy7PpQZpK58WwTC+As16E2uTDDCcPSMB1GP24P
X-Received: by 2002:ac8:5f4a:0:b0:3e3:90bb:ad9b with SMTP id y10-20020ac85f4a000000b003e390bbad9bmr45748255qta.34.1680270810063;
        Fri, 31 Mar 2023 06:53:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1680270810; cv=none;
        d=google.com; s=arc-20160816;
        b=V2Zielir34/ZflgbqRzPxPs/S3MrSqrzm4/3UYqZFOctbL8OXmAQmjdeJVohBz0PU8
         OMVEqllbBnsL0SBmBILsyDT6EWzQ5JhbfizoQ9vu6Y1AbjQmY6XrDWO8ol/UyOqL3E6l
         Hcs74Mo/jyRHCQfoHm6Dja38ehmhRlj92HKIC7qDSLDxQICNTMaIU120steIAM/JtoMX
         JhB8T2bdFqL0qmktkaMXzGmw7WyA/uVfzXvYgD8+pSGYa1w2u/47HW5hID/LyCdumse6
         csil8Y48wNnZ9ugk4yZfo2RWBtjtvhvYYi11W036yWvrD8OhkljXw3iP700Z+Eurr+I0
         5XQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:in-reply-to
         :content-disposition:mime-version:references:message-id:subject:cc
         :to:from:date:dkim-signature;
        bh=TNnCkGapJJW2deY2FwRAI1TA6GA8JBnQAgxQXgsdp40=;
        b=fMQ1w3m7AeVw1NemZ0qJpkIWBZiAwwgCyU3zx4lG+sN96HMd3hTHQgdcz0eDXf+XUJ
         Y13EQygUrXWVyplFYna82TmMArS0qXDqqdTxkN0T7U4WLZv6rJ6hCUM2LDeLr7fPRIfD
         IAIqpj7Z9bnQopZtE2hOWwyMM7TRnG8Cks02XAzhBXmeFgAxAXR8xs+HJDd19sNF70Sd
         88Qkv2eTwetsML4EMeH7e3wN2bVB2rP6hn2THOutKVFZDljRH6U/6PYM5ZQ6H6LNNiVR
         Wu7fcghUj8M1MlRLUayeLG1iw2B+1Gths9OE5LCechkdvk5SXf9MRG4hVXMUOdiPU1z4
         nnlw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20210112 header.b="e2MZEYU/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=acm.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c7-20020a05622a058700b003e3348193f9si1463757qtb.635.2023.03.31.06.53.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 31 Mar 2023 06:53:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20210112 header.b="e2MZEYU/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=acm.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1piFBs-00079S-QB; Fri, 31 Mar 2023 09:53:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tcminyard@gmail.com>)
 id 1piFBm-00077S-Fx; Fri, 31 Mar 2023 09:53:12 -0400
Received: from mail-yw1-x1131.google.com ([2607:f8b0:4864:20::1131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <tcminyard@gmail.com>)
 id 1piFBk-0005qp-Tw; Fri, 31 Mar 2023 09:53:10 -0400
Received: by mail-yw1-x1131.google.com with SMTP id
 00721157ae682-5416698e889so416352247b3.2; 
 Fri, 31 Mar 2023 06:53:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1680270787; x=1682862787;
 h=in-reply-to:content-disposition:mime-version:references:reply-to
 :message-id:subject:cc:to:from:date:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TNnCkGapJJW2deY2FwRAI1TA6GA8JBnQAgxQXgsdp40=;
 b=e2MZEYU/fCEJRl2Ale1sS1WT6syo91r035W1fpB1RELOT9+vIbJQOtFgB5AMdbnPKf
 lFEz51d3GVuidyoB3UkRP+9AbMVAi7zKiXpT/+Sonq4rL1UIN3bu6uUSBTJEHuaTDLpw
 5biVc+h/2WILfoGPYMbd72I8IwmuVCZ2cqXaAcHTruWEmZgBDsW+q58XydTT0dUs4uf0
 t3QPntTk0gHTNWzM4+6k6bt+qQbQVVD8TNYWKLLvDi9ZvK1ccldJu95V3Ll1xdbjqBDP
 CG9B16dZGTQxKmDOKKOkKfVNvcRdeFjmDz5XUih6DuaS3AmUkjHlXK/WKdIun9zSMdNq
 vTEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680270787; x=1682862787;
 h=in-reply-to:content-disposition:mime-version:references:reply-to
 :message-id:subject:cc:to:from:date:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=TNnCkGapJJW2deY2FwRAI1TA6GA8JBnQAgxQXgsdp40=;
 b=3SN7+FZmx1BzhBYRzUDZwCVTAMnBIVZNx5o4hF0t3+nOICGhUrUjy1SgPQyrxUJon0
 AdqanpTWua96T6AKL4DA8Tp+7Fzdvtz1z4DhaCfA34w1CfDboDL3J/oQ53r3WsihJCW2
 iUzaNCOFZNZ2Akl6Ed9KGE4QecvDqyM/Q76wN/6JHD8LVkxeIcal7Z2jrN30T62Cy+Z9
 /nyeKLvDBW2Sz6PETHDd9sZnRCFqmZMJAeWwsMlphTdyILrO1OTJ19DJ9fMfgwOC4o+0
 NEiPRnXGlsIWGTNwp3nh5UDPuVwzf5trHRVNdiFv9tpU+1oahM8Tkn0FF2P6Rz3O8uO+
 ZCMw==
X-Gm-Message-State: AAQBX9dpexfsvqT6RcEc/HniMbgOdHJ5MFTPx8P9/nCEhWRQ2ku/NBMs
 BWD2YQNezwA6XCjqUBFIZQ==
X-Received: by 2002:a81:a209:0:b0:545:91c2:d5eb with SMTP id
 w9-20020a81a209000000b0054591c2d5ebmr24582598ywg.28.1680270786987; 
 Fri, 31 Mar 2023 06:53:06 -0700 (PDT)
Received: from serve.minyard.net (serve.minyard.net. [2001:470:b8f6:1b::1])
 by smtp.gmail.com with ESMTPSA id
 a6-20020a814d06000000b00545a08184efsm528678ywb.127.2023.03.31.06.53.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 31 Mar 2023 06:53:06 -0700 (PDT)
Received: from minyard.net (unknown [IPv6:2001:470:b8f6:1b:4b5:7e28:63da:3be])
 by serve.minyard.net (Postfix) with ESMTPSA id 9B2B01800BB;
 Fri, 31 Mar 2023 13:53:05 +0000 (UTC)
Date: Fri, 31 Mar 2023 08:53:04 -0500
From: Corey Minyard <minyard@acm.org>
To: Titus Rwantare <titusr@google.com>
Cc: philmd@linaro.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 Patrick Venture <venture@google.com>
Subject: Re: [PATCH 4/7] hw/i2c: pmbus: block uninitialised string reads
Message-ID: <ZCblwJd3OnpUTMyF@minyard.net>
References: <20230331000756.1712787-1-titusr@google.com>
 <20230331000756.1712787-5-titusr@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230331000756.1712787-5-titusr@google.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::1131;
 envelope-from=tcminyard@gmail.com; helo=mail-yw1-x1131.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Reply-To: minyard@acm.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: cExkmDOTUc96

On Fri, Mar 31, 2023 at 12:07:53AM +0000, Titus Rwantare wrote:
> Devices models calling pmbus_send_string can't be relied upon to
> send a non-zero pointer. This logs an error and doesn't segfault.
> 
> Reviewed-by: Patrick Venture <venture@google.com>
> Signed-off-by: Titus Rwantare <titusr@google.com>

Acked-by: Corey Minyard <cminyard@mvista.com>

> ---
>  hw/i2c/pmbus_device.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/hw/i2c/pmbus_device.c b/hw/i2c/pmbus_device.c
> index bb42e410b4..18e629eaac 100644
> --- a/hw/i2c/pmbus_device.c
> +++ b/hw/i2c/pmbus_device.c
> @@ -94,6 +94,13 @@ void pmbus_send64(PMBusDevice *pmdev, uint64_t data)
>  
>  void pmbus_send_string(PMBusDevice *pmdev, const char *data)
>  {
> +    if (!data) {
> +        qemu_log_mask(LOG_GUEST_ERROR,
> +                      "%s: %s: uninitialised read from 0x%02x\n",
> +                      __func__, DEVICE(pmdev)->canonical_path, pmdev->code);
> +        return;
> +    }
> +
>      size_t len = strlen(data);
>      g_assert(len + pmdev->out_buf_len < SMBUS_DATA_MAX_LEN);
>      pmdev->out_buf[len + pmdev->out_buf_len] = len;
> -- 
> 2.40.0.423.gd6c402a77b-goog
> 
