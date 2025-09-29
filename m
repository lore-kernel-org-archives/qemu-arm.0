Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50B5ECAC5B5
	for <qemu-arm@archiver.kernel.org>; Mon, 29 Sep 2025 10:39:18 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v3BHc-0000Y0-HE; Mon, 29 Sep 2025 06:39:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1v3BHa-0000XC-Ld
 for qemu-arm@nongnu.org; Mon, 29 Sep 2025 06:39:02 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1v3BHQ-00043g-Qm
 for qemu-arm@nongnu.org; Mon, 29 Sep 2025 06:39:01 -0400
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-3f99ac9acc4so3682829f8f.3
 for <qemu-arm@nongnu.org>; Mon, 29 Sep 2025 03:38:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1759142325; x=1759747125; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=GkQfNdF8/1YXaWqYo9IuawZRMCWQcQ2zbgerS62scVQ=;
 b=Xc91OhTqm3PP1uJLbx3z0fI6iSwapL2kYT4DPUXsQm7LTeekbTuBRzpeOJ8y8JO2Jy
 oqHeAmC8qMBRZzxlkv8pJw/+dqUgEl126jHuCFJ5w4TutWhLDmWc9HocnoFZ9nOuqy27
 iXrOTMb+AcOL2B9IwW05kY6GQoLQyskd+7zIPWmNXr5j0weR8p5vYJyCc+z59bl/79qP
 5QgGRMMGoo6lZt5F0H5NTtUXUQZ7sGrUALQIsa0luxft7bFafIwCJgW8tjwSZP7045DX
 1NC3RRS9EilJsenVQj1GsyTetBbwS6xriroDp6RBAdwwVRxL0N5RFxKgXCNAR5MwJPRV
 lTdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759142325; x=1759747125;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=GkQfNdF8/1YXaWqYo9IuawZRMCWQcQ2zbgerS62scVQ=;
 b=ZO9lCQJfJ0Wn2Ekv4HzObyrQXb6GOSGjKY53Tv6QvOVQUZvrtsi1B6BSp2rPaNodUy
 S1NCEt4J74GJrSCofXTW1R1tY38luOjgUT3wRRpzLvP5KaZ7fdd+2wi4Hy4JMq2HwYcF
 wMjoEKleQLNaitk9oVi3UkmVBQ61h+ly4G7ua7/jiQQtMuL3aqQa/MIUt+Bb2n9EMsKO
 SZlT7umrKOhkb4DaRyuJ8c+su0tfEyQtNpTMiUODwb/nKsK37wr5ZosWmTEI8B/chUbm
 MolrY8V2Y2I8ly39GuglA9EuUYbMAej4NlHlEAJ7eAWMxjsm0Fl/9TVdXYDQpPDRxnnr
 xGIw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXWaA9xwTcd3Gur5BZyUAOIX8yXr1vScYX039GP7Q/fZmqP4ZUmScBii+DLgyZRXqpNzTCs1SGrGg==@nongnu.org
X-Gm-Message-State: AOJu0Ywk3xQUgtr9wRWDzKAjlXtk3MbJ3vpaMFXF8qpHpkcPrdowiqAm
 +8+VOMNo2ups9QmGbT4kGUSD2+M7UDALfuFkl2z6gP6dOnG+tGt18AdPhaB6PuEg1rE=
X-Gm-Gg: ASbGncubizHXfCAF++FptoQ9RkwFfLfunHwfvUFrXHmgXHibr2UxvE3pPRYUWjRtBx6
 /RzKO6hU3vnaemK/rMw2Qwrd/hGcekduNht6VXPMQf2zKyMixMqrYdYZ5LFynsPU7lIfSmMZ+8o
 bZR7H8swsgB9qcjHFeLeQSGXTuHSLiaolxlh+fGsfW1zJ9RUwptmKz4j5k6BJhxXldPB6IuEezb
 KqEGzhKRZaPK7v1vvS3ScCVs7cNUWLdT8Cqxny8A2dBUZTbPukGLBSoPNktbt/+QUHZ87LowsTD
 2CY7/uXT1iXDZZy3yAJPKo0vB2MsxIspDCMuoy6JptrlagaLby5r2RBR8MHYiGRkh5uVWBcHHk3
 m8S2jxjTEwxI7jaLqNSIIyDHThYUH7VWppravqbOPVrPuekgitxYe+twQMGTRodDQReMoL8xkfv
 K1
X-Google-Smtp-Source: AGHT+IE4mtKkv7JaKO93A0mFA/dVWpaP/FCqlB/M9qgTmi/cJAXBlzpzk5irWWm2ugiklkZBqKdQ+A==
X-Received: by 2002:a05:6000:400b:b0:3e8:9e32:38f8 with SMTP id
 ffacd0b85a97d-40e44498167mr16297596f8f.14.1759142325453; 
 Mon, 29 Sep 2025 03:38:45 -0700 (PDT)
Received: from [192.168.69.221] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4151d0ae6f9sm13268199f8f.51.2025.09.29.03.38.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 29 Sep 2025 03:38:45 -0700 (PDT)
Message-ID: <83f7009f-1464-475c-9694-0af3a4fea4ba@linaro.org>
Date: Mon, 29 Sep 2025 12:38:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 46/47] hw/arm/xlnx-versal-virt: add the
 xlnx-versal2-virt machine
Content-Language: en-US
To: Luc Michel <luc.michel@amd.com>, qemu-devel@nongnu.org, qemu-arm@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Francisco Iglesias <francisco.iglesias@amd.com>,
 "Edgar E . Iglesias" <edgar.iglesias@amd.com>,
 Alistair Francis <alistair@alistair23.me>,
 Frederic Konrad <frederic.konrad@amd.com>,
 Sai Pavan Boddu <sai.pavan.boddu@amd.com>
References: <20250926070806.292065-1-luc.michel@amd.com>
 <20250926070806.292065-47-luc.michel@amd.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250926070806.292065-47-luc.michel@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 26/9/25 09:08, Luc Michel wrote:
> Add the Versal Gen 2 Virtual development machine embedding a
> versal2 SoC. This machine follows the same principle than the
> xlnx-versal-virt machine. It creates its own DTB and feeds it to the
> software payload. This way only implemented devices are exposed to the
> guest and the user does not need to provide a DTB.
> 
> Signed-off-by: Luc Michel <luc.michel@amd.com>
> Reviewed-by: Francisco Iglesias <francisco.iglesias@amd.com>
> Reviewed-by: Edgar E. Iglesias <edgar.iglesias@amd.com>
> ---
>   docs/system/arm/xlnx-versal-virt.rst | 49 ++++++++++++++++++++++++----
>   hw/arm/xlnx-versal-virt.c            | 37 +++++++++++++++++++--
>   2 files changed, 76 insertions(+), 10 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


