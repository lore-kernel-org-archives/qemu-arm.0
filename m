Received: by 2002:a17:504:5f65:b0:1be9:327d:8ee3 with SMTP id gl5csp2959666njc;
        Tue, 25 Mar 2025 15:55:33 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWwTsFv9rOR92AQ+se04CumdHX0jwo2fdLmn5TeaiV6PkPa0C910BqPNEtxIzSOv8QJf5lX0l02fAk5/Q==@linaro.org
X-Google-Smtp-Source: AGHT+IFnPq1Mjwa83AwhcLw40TWO9pBudTpqoLVBCo5k35AnOEmgrfZJ3vg2cXaVp+uc7mJU/7dM
X-Received: by 2002:a05:622a:260f:b0:474:e711:3c7f with SMTP id d75a77b69052e-4771de63dadmr364905151cf.43.1742943333695;
        Tue, 25 Mar 2025 15:55:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1742943333; cv=none;
        d=google.com; s=arc-20240605;
        b=WfSarp9PM2+vvT4on0pgRrMTE6q79KIL5QBhKHwqpyNGGSDSf1Nm+Shw2cWyy509Ee
         O+MsX1attNBoxg2m9uqeBDSPdwK3OqjwvKnj7sxXLkyE4i9RKtJ2N9R68r+9FhcU4YIN
         5nLiIKPg++WbYWjdInNL4wZpqMQGOKue0TvE3Pqy9m3yBA7+rcSHJBJTWf/++utrWbMa
         rDxEr5DUxMGKNlrl9dBDZCKdz4F0lWN4+DtP1CD27jjuUXhwpF2ZvVmO0OQbC95YsBDq
         O21vNwT7SxcOEMR5iRNYQACLmrHwTXLSTMiga0oTkK/IMujwLWsIvl33t5Et0mSTIwdj
         wJ+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:in-reply-to
         :content-transfer-encoding:content-disposition:mime-version
         :references:message-id:subject:cc:to:from:date:dkim-signature;
        bh=PfZDCKs3ZZUCUEu3Ht/6snT7EFTNozaP+2Yg92XkYUQ=;
        fh=dxqGJITJHiCcHSOrrqOSHuceRn5gujwjC9LT1SDy6R8=;
        b=Lj2LsU5FFpwKUIJr+TEIGVeyBBrKZattcwL6xIvk9Zyhs0BJHLklHed0qZBAeLN1/x
         EwEvCK2zEwOpAxL6ZRpUvVnlOfG1P2dvBGx2U8xon99dqeT72wfOas1HHCeJhpIa0mo5
         4fwPC1GpqUqvnAHOArS1obVw/XcrxjsFrtF2JVFIkfTFmEFKJChXrIClsr3Eo/fLEfej
         WZXBumxYu9wXt22HPwDhFGEL55iuY8qjbjPOYWXRQsdvWPS8mV1tsaVvYD9DOOyKgHLM
         8lIHzR5MjICxugpoqcU87p95NtMhdiGhs+kPDqD/wP4HmX2Qams1hA4pQ0EdHSzMxW3u
         g/WA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@minyard-net.20230601.gappssmtp.com header.s=20230601 header.b=JBNZrLLM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4771d4fe5b4si103106421cf.239.2025.03.25.15.55.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 25 Mar 2025 15:55:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@minyard-net.20230601.gappssmtp.com header.s=20230601 header.b=JBNZrLLM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1txDBC-0003Kv-00; Tue, 25 Mar 2025 18:55:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <corey@minyard.net>) id 1txDB4-0003Jh-6L
 for qemu-arm@nongnu.org; Tue, 25 Mar 2025 18:55:23 -0400
Received: from mail-oa1-x2c.google.com ([2001:4860:4864:20::2c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <corey@minyard.net>) id 1txDB1-0008OY-Mg
 for qemu-arm@nongnu.org; Tue, 25 Mar 2025 18:55:21 -0400
Received: by mail-oa1-x2c.google.com with SMTP id
 586e51a60fabf-2c1caacc1f7so3430679fac.3
 for <qemu-arm@nongnu.org>; Tue, 25 Mar 2025 15:55:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=minyard-net.20230601.gappssmtp.com; s=20230601; t=1742943316; x=1743548116;
 darn=nongnu.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:reply-to:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=PfZDCKs3ZZUCUEu3Ht/6snT7EFTNozaP+2Yg92XkYUQ=;
 b=JBNZrLLMZ0z2UJijw1fozHp0wnDNQgDKYGAVfjVmSApQ8Aa3jKaL3uFEYT4RE8K2KS
 wAS2uZzuZsWTB8omsnC/V6UzzROj8kuROe6IRKzrI4Cf0O83+oK2dSpxS3jCpi62cBtt
 LrVHp/1SaQX4Uf5kHlS4TmIC3WFokFo4Eu4phKOm4RBKq8LWw/FoKiCK7VzXtNma0Ojv
 vR4ZBgXeMVoOMQvTmOMydL+TZe9UaDfUK+jK/gGR9Hz+OovnjtD17su029zmjVdb3aZG
 UPoZRAfUqpAzLz05C1/L0sn5UWU2lrm0j+JMZ/Y+2X7XO97Z/bSC2lI26cWi3VijVBgB
 9GsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742943316; x=1743548116;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:reply-to:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=PfZDCKs3ZZUCUEu3Ht/6snT7EFTNozaP+2Yg92XkYUQ=;
 b=m3rDdxNu7G3aV52Dh2eb8XsKaBYK/Wflj9MoAoGEa4iMbkV9sJiUyvEA6hEiKqaBD1
 z/ca15XPvFBgKmQkq8Wuz/FhXZ6YdWB+mvjFlJwUZJuN+GS12R4cPmHUFJfj+h+cfiHA
 lJYm3wP5YcQICRm1VAgZl0TzkbyHKC5yvFK9PTQIJH0shDJYBJyVWbjZGmxoE511h53k
 OwuiqqHoLAc4ljVNDuWknX3APlUcIsAuQNVqzgCGOLD2ZLfCt/1Ux1O6K12Nh7MM7erC
 r3F0cUZQ2r4vB/aOLwYmcRTPOojnBw+2qncB+6Rvud+GeJ5+ZoMJ0H+yD3/htRMC/hNc
 8EyA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWD6ki0SyDsZnAe8ulRCLnWQ4NA7pL4aqUcYz5jZzM77J00P2/z2ajwlCHkTc4yZX3aHSgmp0Vz2A==@nongnu.org
X-Gm-Message-State: AOJu0YyIMuVz8HePi8ZKSfIqWH2BcvUISz9lO9WF+YtgkGdv4lNvjsQb
 32I7jcBivbdFftnrYBNFmtOIHwvrfcE8ZtQ+Tnl5ZaQoU/GhR5mwjTqZe2cx5is=
X-Gm-Gg: ASbGncuWzm3ViDB5br+5ASU/quuty3EYFlwlO/VU4nYF1jTyo2bscvMIQVRVssllkVx
 j1jxS+Ek2iDjlzcKejzsgrXZ8mnxYWQd64T+3lxDwz43JdLn8Z5WoScIfqgv1PAl63tLRzzDfw7
 mL2B8hE3RSfg8Syre1taxxxI/aEybMRP0k2hMB2EO0CtUV9rqwD2ymSTIt+aSTaPDPLDUiTxLdg
 U4XJPbGkthjHm/UUAKTbQs2cPPetaffwP0ZWku3zcH8WxmqUw0IBSMPXiRYGgGZw9PZ01BFjvRM
 e5KiwKOcwvZn+Z0RUy+S+63gbRNq75Mhj2E5Tu3vKSN6t9uz
X-Received: by 2002:a05:6870:a112:b0:29d:c85f:bc8c with SMTP id
 586e51a60fabf-2c78054b065mr12483637fac.36.1742943315624; 
 Tue, 25 Mar 2025 15:55:15 -0700 (PDT)
Received: from mail.minyard.net ([2001:470:b8f6:1b:7eec:65ba:af63:5029])
 by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-2c77ecda836sm2728604fac.25.2025.03.25.15.55.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Mar 2025 15:55:14 -0700 (PDT)
Date: Tue, 25 Mar 2025 17:55:07 -0500
From: Corey Minyard <corey@minyard.net>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 Ilya Leoshkevich <iii@linux.ibm.com>, BALATON Zoltan <balaton@eik.bme.hu>,
 =?utf-8?B?SGVydsOp?= Poussineau <hpoussin@reactos.org>,
 Matthew Rosato <mjrosato@linux.ibm.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Glenn Miles <milesg@linux.ibm.com>,
 Samuel Tardieu <sam@rfc1149.net>, qemu-block@nongnu.org,
 Patrick Leis <venture@google.com>, David Hildenbrand <david@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Tyrone Ting <kfting@nuvoton.com>, Eric Farman <farman@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Halil Pasic <pasic@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Kevin Wolf <kwolf@redhat.com>, Alistair Francis <alistair@alistair23.me>,
 Bernhard Beschow <shentey@gmail.com>,
 Hanna Reitz <hreitz@redhat.com>, Hao Wu <wuhaotsh@google.com>,
 qemu-s390x@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org
Subject: Re: [PATCH-for-10.0 06/12] hw/i2c/pca954x: Categorize and add
 description
Message-ID: <Z-M0SzZFk1yihEi0@mail.minyard.net>
References: <20250325224310.8785-1-philmd@linaro.org>
 <20250325224310.8785-7-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250325224310.8785-7-philmd@linaro.org>
Received-SPF: none client-ip=2001:4860:4864:20::2c;
 envelope-from=corey@minyard.net; helo=mail-oa1-x2c.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=unavailable autolearn_force=no
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
Reply-To: corey@minyard.net
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: aPGIggw4lvg8

On Tue, Mar 25, 2025 at 11:43:04PM +0100, Philippe Mathieu-Daudé wrote:
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>  hw/i2c/i2c_mux_pca954x.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)

Looks ok to me.

Acked-by: Corey Minyard <cminyard@mvista.com>

> 
> diff --git a/hw/i2c/i2c_mux_pca954x.c b/hw/i2c/i2c_mux_pca954x.c
> index 779cc4e66ed..100b8d86093 100644
> --- a/hw/i2c/i2c_mux_pca954x.c
> +++ b/hw/i2c/i2c_mux_pca954x.c
> @@ -175,12 +175,18 @@ I2CBus *pca954x_i2c_get_bus(I2CSlave *mux, uint8_t channel)
>  static void pca9546_class_init(ObjectClass *klass, void *data)
>  {
>      Pca954xClass *s = PCA954X_CLASS(klass);
> +    DeviceClass *dc = DEVICE_CLASS(klass);
> +
> +    dc->desc = "PCA9546 I2C multiplexer";
>      s->nchans = PCA9546_CHANNEL_COUNT;
>  }
>  
>  static void pca9548_class_init(ObjectClass *klass, void *data)
>  {
>      Pca954xClass *s = PCA954X_CLASS(klass);
> +    DeviceClass *dc = DEVICE_CLASS(klass);
> +
> +    dc->desc = "PCA9548 I2C multiplexer";
>      s->nchans = PCA9548_CHANNEL_COUNT;
>  }
>  
> @@ -226,13 +232,13 @@ static void pca954x_class_init(ObjectClass *klass, void *data)
>  
>      rc->phases.enter = pca954x_enter_reset;
>  
> -    dc->desc = "Pca954x i2c-mux";
>      dc->realize = pca954x_realize;
>  
>      k->write_data = pca954x_write_data;
>      k->receive_byte = pca954x_read_byte;
>  
>      device_class_set_props(dc, pca954x_props);
> +    set_bit(DEVICE_CATEGORY_BRIDGE, dc->categories);
>  }
>  
>  static const TypeInfo pca954x_info[] = {
> -- 
> 2.47.1
> 
> 
