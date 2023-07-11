Received: by 2002:a17:906:1917:b0:98d:b2f5:1316 with SMTP id a23csp1978072eje;
        Tue, 11 Jul 2023 08:31:57 -0700 (PDT)
X-Google-Smtp-Source: APBJJlG4A7EYwEvt4VIAUt2QNjEwlJ4QBnW8eybM5Z6NY0E/dArCLIdaq0CcLhZPoouPnrYXQKV7
X-Received: by 2002:a05:620a:28cc:b0:762:3841:c098 with SMTP id l12-20020a05620a28cc00b007623841c098mr22467776qkp.30.1689089517197;
        Tue, 11 Jul 2023 08:31:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1689089517; cv=none;
        d=google.com; s=arc-20160816;
        b=ASZNrp6HRZKcZ6UBh9/gjBZUsMGQIMf52J5Kaoc8u/kQDL3dHKPSAsWCkDMLfVa4Jj
         74SfuH2KHFDQk0KxR1M29lOA+KV4wdwXgA41DtHbdgKhbwVTnghIg4utPCmwRnKExQxy
         J0RHAuWQWVgrNMkw1n15s4NofMiyVSP5N0ewAbQ34uEmfCIjJhHiCbR+9XpG0SnLQaI+
         Ntgnn9t47uf0G0U9w2juIcaT9Pt7tUqGS/w2+6OF+5pA2dYDB5wD0MJX9oHoIbz8pSVl
         hSkGRZS4vjr2tj+e5jvevoqFoAMhWRnM1CTfEziUu270rdo+WqdaHrxrzxFUX6KDS+f2
         dS0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:organization:from:references:cc:to
         :subject:user-agent:mime-version:date:message-id:dkim-signature;
        bh=mVcqr+vjtLmlApNnpqx2TXvOgEK8lOceCz3+QYiBkGw=;
        fh=gVUuOi0eOK4FUsnvRP2mScwy7cOsRrLbCxi87Wkm/E4=;
        b=R4qjOQ8gk5ChJQOW32P85169LpiGcOX2DDtAa0qi7OMFde3dI4ZmOs0FTqXxdXzlbz
         8EoSpiixGUH5bHoLO1sQDSjAQbAeJ0a4QlVSpCX4G4AswLA/aZ/v1BG/kk6qle2SbLV+
         saEBLFxP3Isz4yK7QsGhElul8P9Gip4b1lS1OzX8Cv+9k2hC38vSVdtknV+PImwPk2ir
         AaNRZSDpU7MDYFE6urG9iGRID+d7DLNqm/tkSG3zmsFqIYKwuJBhuisOmVYHrek8D82O
         FHkycj/wWlySjFcvXGF3Gz+sZ7L8oBNoxcUFFvZfOI8KZfjwXOOQbj8jUShMLNtQ0QX7
         H5zg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=JxIwZZua;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f18-20020a05620a409200b00763d9a208e3si884260qko.313.2023.07.11.08.31.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 11 Jul 2023 08:31:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=JxIwZZua;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qJFLB-000536-BW; Tue, 11 Jul 2023 11:31:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1qJFL8-00052Y-By
 for qemu-arm@nongnu.org; Tue, 11 Jul 2023 11:31:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1qJFL6-0004xM-TQ
 for qemu-arm@nongnu.org; Tue, 11 Jul 2023 11:31:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1689089504;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mVcqr+vjtLmlApNnpqx2TXvOgEK8lOceCz3+QYiBkGw=;
 b=JxIwZZuaiCOB0pFW7yJD6eu4O69ciy+6ktwyr/PmZES5wZ1zT6cFZ9cFeZRA86Hu52aRfG
 ppBHGP3Z0CgxKu/e3LFac8b/kJ09At2Cq5cZ3eETSoveNyGnIYv2gOJBRiZlGSp6GflvBu
 jcVBDQW1ttp9MYE838FTJcuF2apyq/E=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-659-4ggz3fqKNB6lJm5peDSBbw-1; Tue, 11 Jul 2023 11:31:40 -0400
X-MC-Unique: 4ggz3fqKNB6lJm5peDSBbw-1
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-30932d15a30so3602782f8f.1
 for <qemu-arm@nongnu.org>; Tue, 11 Jul 2023 08:31:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689089499; x=1691681499;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=mVcqr+vjtLmlApNnpqx2TXvOgEK8lOceCz3+QYiBkGw=;
 b=g+unGr1pGXrerrArzRIxVjozv8JbZ+YH39YgJeu2llLDqQ0QBKaMIl9JfWVx8b7FCL
 wPGQXm7Ha/IljU959FzUIZ411Ah6dfO+GWAux7Ip7CgBQjfpr5iYDOj8ANnKcaZcQTqt
 DlP9gePuSUYk0iLSGUCaD5WChAYIXwGzFHC/5qOQdTIcMxdxkEb0c7ug+p0VyOqqCLOr
 QoVU0X/uTwn5Q2t+rZYLf2T05a946rxxK3IRZ8FNRcEIxdQjnupjXbvr6YrRGrLiw3Ag
 Bv1Wr5FxrgZ4QMi3s2Am8ftjG8JHIAno9LtiLSbDAL3k24NymxsVIXc1UbSN3AubOWyh
 ccNQ==
X-Gm-Message-State: ABy/qLarQ1wC98zyCArQH8/0BmCxpH4a45SHnR8BdKYxne3m3EAisZJl
 UsOrwnXqELg19Jd+VtQeQenzeitfL12z/fm+w5UsKTWtSS0FaHjaKlzMU1olGlf6qHBmR1mOoiX
 jJfJgzdVyPJ3/
X-Received: by 2002:adf:e310:0:b0:313:f371:aede with SMTP id
 b16-20020adfe310000000b00313f371aedemr16289361wrj.1.1689089499420; 
 Tue, 11 Jul 2023 08:31:39 -0700 (PDT)
X-Received: by 2002:adf:e310:0:b0:313:f371:aede with SMTP id
 b16-20020adfe310000000b00313f371aedemr16289342wrj.1.1689089499099; 
 Tue, 11 Jul 2023 08:31:39 -0700 (PDT)
Received: from ?IPV6:2003:cb:c745:4000:13ad:ed64:37e6:115d?
 (p200300cbc745400013aded6437e6115d.dip0.t-ipconnect.de.
 [2003:cb:c745:4000:13ad:ed64:37e6:115d])
 by smtp.gmail.com with ESMTPSA id
 w13-20020a5d4b4d000000b003143765e207sm2516288wrs.49.2023.07.11.08.31.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Jul 2023 08:31:38 -0700 (PDT)
Message-ID: <b44555cd-5c6d-3736-8e7a-cdd6acf612b7@redhat.com>
Date: Tue, 11 Jul 2023 17:31:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v3 0/7] virtio-mem: Device unplug support
To: Mario Casquero <mcasquer@redhat.com>
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>, "Michael S. Tsirkin"
 <mst@redhat.com>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Igor Mammedov <imammedo@redhat.com>, qemu-arm@nongnu.org,
 Gavin Shan <gshan@redhat.com>
References: <20230710100714.228867-1-david@redhat.com>
 <CAMXpfWsD9_UvB6cez9oKZt9PREkVALhX0sQ=Qyok78juME78jQ@mail.gmail.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <CAMXpfWsD9_UvB6cez9oKZt9PREkVALhX0sQ=Qyok78juME78jQ@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.089, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: fUE6tr5x5ssA

On 11.07.23 16:19, Mario Casquero wrote:
> Tested-by: Mario Casquero<mcasquer@redhat.com>

Thanks a lot Mario!

-- 
Cheers,

David / dhildenb

