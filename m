Received: by 2002:a17:906:fc07:b0:9bd:85f7:2662 with SMTP id ov7csp1171495ejb;
        Sun, 22 Oct 2023 23:48:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGw0eS+JtIAwQcLa6viUXxIYIFAW+W/zh8HJP3ZcnU1QHwO8J1smI2+yQKkPYoI/F2I78u0
X-Received: by 2002:a05:622a:1a03:b0:419:513e:4aeb with SMTP id f3-20020a05622a1a0300b00419513e4aebmr11216479qtb.51.1698043687940;
        Sun, 22 Oct 2023 23:48:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1698043687; cv=none;
        d=google.com; s=arc-20160816;
        b=FUWlJEwszzs3nfHlcw0Nco+eeyXHeYX7DcCi+7nHGJYvrEsW4oP8Ko0wBGUrOVRZAl
         /uITMfZ3MKTGca/TSfPGwMUPjpZYJ7jOzm+UIo4wn6DUJoYCEk0TyzLZSt+rXGSnIiNr
         VdpiIa1AEewsRDBUp332hBNGat6snrVatXrSbm5JpUJWV2Lv89cznXnLl1nWYX63iFZR
         bJUUg1dWU7EIUmt78RjNDn9FDlta8PkSYSDSt7DVOJAkAZcYpNGHqbGywyH3fTYuuXSJ
         yMU1KK4bgT6s7ey/W60ZKxE/e572R7cp0e2zAtxEKGixcxH7nBPAQX9Cl3WDFj/o1o6C
         eG9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:autocrypt:from:references:cc:to
         :subject:user-agent:mime-version:date:message-id:dkim-signature;
        bh=sRsKBS2MKVtRlZuF/oUNbEv6gfGm8VLd7fGrPWt7NRQ=;
        fh=DpkbP7dEedV4PMQm4eXqOJbSESG+s5DDiq4o/Hms8vM=;
        b=dz6AfyU1nje8JprRt1z754j8C1ZX+CBAXFxR6BjCEuV3z2X2AhSWZBl+8oFxzD2BF0
         VL6OGs1wWrumVtemK22OegSaBnK4lxQ4gWHChepkwHH1HIhoC3vtW8kbJbNIuJVWu/fj
         K+W6jHqr7WBHVI8InEm/zcOtlkSV6ra7oTknEqiSTbdIT0P5u4YmYfzl18+I4n/kSHtE
         QJxUArxX3sPVHVXXFyubxJq9zq7BSIY56isWxsLUmrsGjadfwzy5OPhT08akxsSkZfxw
         dKqZumTAa0gA71JsLHxzuYl7Ipam5VcyDhfBTJVteJWO/8IwawH3NIolNrlEjW03NQVV
         YkdA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=BWNDkULd;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c15-20020ac85a8f000000b00417d1b9910dsi4930020qtc.709.2023.10.22.23.48.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 22 Oct 2023 23:48:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=BWNDkULd;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1quojH-00054F-PV; Mon, 23 Oct 2023 02:47:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1quojG-00053u-Dl
 for qemu-arm@nongnu.org; Mon, 23 Oct 2023 02:47:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1quojE-0001ZU-8i
 for qemu-arm@nongnu.org; Mon, 23 Oct 2023 02:47:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1698043674;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=sRsKBS2MKVtRlZuF/oUNbEv6gfGm8VLd7fGrPWt7NRQ=;
 b=BWNDkULdrzN8zL1QlXimizjLBqJeNrkE2/1ioLIXhUFujKYRDQt1TOfLXTnbKzlRFAHwFm
 z9z4Vvha045P6OxBsKkn4fVjU58HzNolBUGqKh0enFWANuCcBCBKvM6JGxZnqusXY4dCQJ
 2AQnSXFq/2aVOV3AI0GZJkZJQlyPkMI=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-493-cIoOCz9DPbKsW0ts_-tKbw-1; Mon, 23 Oct 2023 02:47:53 -0400
X-MC-Unique: cIoOCz9DPbKsW0ts_-tKbw-1
Received: by mail-ej1-f70.google.com with SMTP id
 a640c23a62f3a-9c983b42c3bso83353366b.1
 for <qemu-arm@nongnu.org>; Sun, 22 Oct 2023 23:47:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698043672; x=1698648472;
 h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
 :to:content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=sRsKBS2MKVtRlZuF/oUNbEv6gfGm8VLd7fGrPWt7NRQ=;
 b=ff8JfCz3O3MZKVVu7KepUIYzIPZIr+0Qw9Zv7R2eDWbNGkq3IWm3Fadxc6oiIDb99q
 mIViNnzZo6g6QCFKbLJgH+FRPpxG3hKXzgs6TIko/mwwIWQVxi8YCtIDqrhdzJMy4N+D
 XRe6jgKOA+XRLjLK6ac1XvBWAdKcTugbzLv6lYUF+I6Pq+33Qej8vdvW3B3YGDhOMnxe
 FlQi6ex6hoLThLclecHUbp+k+pKhz1jlW+Udms/oZpZwBe9BE91EG3A+ft3rXqMxenqT
 BF+bZxDgyj+W0PEzPzmRIBzLeiM9j0c28S8vxAah0Iy9w/dDgCtXl0X7BaKz7PqjPMgM
 C1DA==
X-Gm-Message-State: AOJu0YzsH6FdHuOcXD2n73/Jio07N/b5eOOg8UOW89rDy7UH92XdEkxZ
 BfE8/DpVRzn12DR8t/X4IS4jqgSHGoQoFdbKksVWCussvsz8grjPegNppJ495IknJNwNFsFIBDx
 8d4NlsRHzJPzu
X-Received: by 2002:a17:907:988:b0:9ae:6648:9b53 with SMTP id
 bf8-20020a170907098800b009ae66489b53mr9374234ejc.23.1698043672007; 
 Sun, 22 Oct 2023 23:47:52 -0700 (PDT)
X-Received: by 2002:a17:907:988:b0:9ae:6648:9b53 with SMTP id
 bf8-20020a170907098800b009ae66489b53mr9374230ejc.23.1698043671837; 
 Sun, 22 Oct 2023 23:47:51 -0700 (PDT)
Received: from [192.168.0.5] (ip-109-43-176-141.web.vodafone.de.
 [109.43.176.141]) by smtp.gmail.com with ESMTPSA id
 u16-20020a170906655000b009c3f1b3e988sm6062764ejn.90.2023.10.22.23.47.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 22 Oct 2023 23:47:50 -0700 (PDT)
Message-ID: <fadacc7f-b5b9-4440-9b2d-ccb8679c0758@redhat.com>
Date: Mon, 23 Oct 2023 08:47:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 9/9] hw/arm/pxa2xx: Realize PXA2XX_I2C device before
 accessing it
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
References: <20231020130331.50048-1-philmd@linaro.org>
 <20231020130331.50048-10-philmd@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20231020130331.50048-10-philmd@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: QKoQIzlB/416

On 20/10/2023 15.03, Philippe Mathieu-Daudé wrote:
> qbus_new(), called in i2c_init_bus(), should not be called
> on unrealized device.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   hw/arm/pxa2xx.c | 5 +++--
>   1 file changed, 3 insertions(+), 2 deletions(-)

Reviewed-by: Thomas Huth <thuth@redhat.com>

