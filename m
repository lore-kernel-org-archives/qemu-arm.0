Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 222D5CCFA13
	for <qemu-arm@archiver.kernel.org>; Mon, 10 Nov 2025 14:51:29 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vITEl-0002jp-MZ; Mon, 10 Nov 2025 09:51:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vITE6-0002JU-Ln
 for qemu-arm@nongnu.org; Mon, 10 Nov 2025 09:50:42 -0500
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vITE5-0008TE-1H
 for qemu-arm@nongnu.org; Mon, 10 Nov 2025 09:50:38 -0500
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-477442b1de0so20791495e9.1
 for <qemu-arm@nongnu.org>; Mon, 10 Nov 2025 06:50:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1762786234; x=1763391034; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=0CAKD0S0/ErduNCNipeGluQm7ocygcVqrsf6j+qqNgA=;
 b=Mv6Fe412cqTb4C4bdMxBElMvemV8/v6247J3VwFRC3ruZGQWGjz0uFNHMBge/al5mx
 Gu4tfpog6HKYPAb/Atp4/CG7F/ySgCrlfsfTkBMmq8ehLTulX+eo7Y5RHrA0XrLS7ZBc
 zYW+o2T5amOL+W9xobProWKkK0340h3jsoYhISBZ6x7No+W88n1IhO+Ta33TGn1NzGWc
 a55yPTWbJaRXEtx+RgVu6pg0ueGZpgpMLTxjecjlYvXE4vCOrsCGpAxw/YNMByBM/0BN
 UGVqAyKAc7kRW8q21VlYbVbzmivQ7tnHhP/o7gxEXI+8OPwihsdlxiMkBk2ju/CeBpW4
 HTcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762786234; x=1763391034;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=0CAKD0S0/ErduNCNipeGluQm7ocygcVqrsf6j+qqNgA=;
 b=vhs/x1g9+mzaAlt1vgYVEyBoYeTjrNpf0JUnTLRJWlOGoAzkzDtWCM0IBPN3VBh2tm
 NN4N/4Gwmf65bhEz+g5BFKEbZAtrvZn+zYIxxkZY8x5qcUW8QjQN/6w4/Pu2ccFZQc9X
 /QPoJzerT9wG1MQNz9ezdscsnxn2X/cQjgPOwuADiXcWcM7UV+VfL1/74tURUb0Vnz2W
 Xiz/SnevglfsY/Yh1ZZ1Vv+SOALQS5Ob6imviBo2Z620uyuTk6mjy/WvNqE++Uxm5oCN
 g4tnc5YIiYh5A9znWM/NNMB67sw4LIkmEnPmhPpJ9pnFeTyrOY2pc2XDmwY7LicOyUV+
 C36g==
X-Forwarded-Encrypted: i=1;
 AJvYcCVfZLu0ah/LDAAIJjponHHO2SS8h8cCk9nKJktD6NVMG8PtGZ/HDqjacKlpFtzKCAvNgfegbQcd8A==@nongnu.org
X-Gm-Message-State: AOJu0YwljJoC1CH6QCfVkLxyf2i9pxnI7WLrqfNl5UI8qqrhPnk1Ud47
 /JnKVi7X0avoUskZDmY2wbR+d/JFmcNaONo0sff72gM/pKZ5s2s9L5wRaCIP8BtkmhA=
X-Gm-Gg: ASbGnctP0c+Vq8acg95lGuzaLq+iVc8RUtheXrndTJblNNCnTyrCznl6kI0HEtAFIAP
 w5nI2XP7MYupJSFSyt2oaq2LXGSCM2W7uyzNorKoUPDvKWkgvkjwU9n+xxcsI/V94k4g6LkQoOv
 LjXtq6lIYMKzttlwase+tZTw2lL+6tEP/EJF35NBTDnmkUKls8Dx+Asnokw617bKsskSq0jj2rb
 q919RzZOphj0Pnam7Q5r+Lm3NDHJTB80mB0MVRyrqF5R06tAmFJ/63h0BTP6atNu+NiI5uVsEFS
 LGDC87XJd7DUR+qUeX3WJ8FdIW7tsS+BRpRev2N2qVdbWd+aRi/s0yHGJqh+wGS7/dtqtxOfEBg
 af9uOMoBC/VHfZ88zn1l14WT1itO/RhGh+BpGnMH82fx9SlVv7jPcKxN+nsotWfUYlM62rysyj1
 xgOkibeXtNhl9n2jn4t+lbFec1T25F5wCebhiujPcKWwCco/E5oZUlas57xwl6mjmiSw==
X-Google-Smtp-Source: AGHT+IEraepT+YybrtH94tWHAdlPkXYPXHFi3Jiwq6yifKUt8qZkapS1VyyOT5sb1Z5eYrAKiquFXg==
X-Received: by 2002:a05:600c:46ce:b0:477:7b16:5f80 with SMTP id
 5b1f17b1804b1-4777b166260mr38565975e9.10.1762786233862; 
 Mon, 10 Nov 2025 06:50:33 -0800 (PST)
Received: from [192.168.68.117] (anancy-654-1-85-43.w90-26.abo.wanadoo.fr.
 [90.26.70.43]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42ac677abeasm22944538f8f.33.2025.11.10.06.50.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Nov 2025 06:50:33 -0800 (PST)
Message-ID: <0398f3bd-f91c-46ff-9162-2d16db434ede@linaro.org>
Date: Mon, 10 Nov 2025 15:50:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/8] acpi/ghes: Bail early on error from
 get_ghes_source_offsets()
Content-Language: en-US
To: Gavin Shan <gshan@redhat.com>, qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, jonathan.cameron@huawei.com,
 mchehab+huawei@kernel.org, gengdongjiu1@gmail.com, mst@redhat.com,
 imammedo@redhat.com, anisinha@redhat.com, peter.maydell@linaro.org,
 pbonzini@redhat.com, shan.gavin@gmail.com
References: <20251105114453.2164073-1-gshan@redhat.com>
 <20251105114453.2164073-6-gshan@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20251105114453.2164073-6-gshan@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x331.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On 5/11/25 12:44, Gavin Shan wrote:
> For one particular error (Error), we can't call error_setg() for twice.
> Otherwise, the assert(*errp == NULL) will be triggered unexpectedly in
> error_setv(). In ghes_record_cper_errors(), get_ghes_source_offsets()
> can return a error initialized by error_setg(). Without bailing on
> this error, it can call into the second error_setg() due to the
> unexpected value from the read acknowledgement register.
> 
> Bail early in ghes_record_cper_errors() when error is received from
> get_ghes_source_offsets() to avoid the exception.
> 
> Signed-off-by: Gavin Shan <gshan@redhat.com>
> ---
>   hw/acpi/ghes.c | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/hw/acpi/ghes.c b/hw/acpi/ghes.c
> index 527b85c8d8..055e5d719a 100644
> --- a/hw/acpi/ghes.c
> +++ b/hw/acpi/ghes.c
> @@ -513,6 +513,9 @@ void ghes_record_cper_errors(AcpiGhesState *ags, const void *cper, size_t len,
>       } else {
>           get_ghes_source_offsets(source_id, le64_to_cpu(ags->hest_addr_le),
>                                   &cper_addr, &read_ack_register_addr, errp);
> +        if (*errp) {
> +            return;
> +        }

If get_ghes_source_offsets() can fail, then lets have it return a
boolean.

   if (!get_ghes_source_offsets(..., errp)) {
       return;
   }

See commit e3fe3988d78 ("error: Document Error API usage rules").

