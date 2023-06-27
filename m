Received: by 2002:a17:906:9417:b0:98e:baa:bd63 with SMTP id q23csp1295300ejx;
        Tue, 27 Jun 2023 00:37:33 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ43mOz8Rha5fmzZ70dIekcJU0qEfFwyIKgjYIjTa8qDCMnhzlTSlD3Kb3UuFgbs1LRBb+X3
X-Received: by 2002:a05:6402:12d0:b0:51d:a94b:f8e9 with SMTP id k16-20020a05640212d000b0051da94bf8e9mr866569edx.2.1687851453506;
        Tue, 27 Jun 2023 00:37:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1687851453; cv=none;
        d=google.com; s=arc-20160816;
        b=0NCGM2UWbde8RIJNHt7g6CZY3+x4c/Pa+OlW1x6HhJnApHJrc8K5nVLHTkDYC9LvCc
         TQcQ9go+e2nC4eiti5kJp7ASJ0ituKum0raYa1lCebUJLHE5NKBIjMOsblL3Jat0ZwVO
         3UBak4sh9gNYZBkkrYz9ijZGIp50uKKfMPLO7UfcZp06ZRGkeVg/eK3R7e5vAvqsX4Ez
         90otICwh1/sWGuC2bG30jrPTbPvVX6khnO9ZQMtZix8cwaYj1Vz71BClpaekCZEZHwXW
         33EhWjHu3GzLj9kcG3rAowwt6E63VA1lDshQnVCxCoBANwnAOi/bpf+hBNbEw8Ad/csY
         2p2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:reply-to
         :user-agent:references:in-reply-to:subject:cc:to:from:dkim-signature;
        bh=+xgQgUPMb1TaJ3VDoJF0EsH3bpnjRmp0el7s7zL4UX4=;
        fh=ftJoetW81GVUAhjBcO2+tg71GFHVEVGvLbKjgbSLmQc=;
        b=eNkiW4Mkpkqo9+Qr8X8///YKwCAeZtSTu0HSgVdbwlIgf8V23kCvGPFHMPQRslg5wz
         yuYwdVUEv8/JqYwO+L2p++yzdX0APdYBAO2jZqKjoDAnfkU0UOGpxu1bTact+Tw9U4bv
         /xJTv6lAcTgV/eXDKzsl1IYZOktcZ33iBJw4cArwgwQXee5AXJ3aN6d2JLdILW0Cg5L4
         e4GuxURCsZS8EMIHHBd78rXMBt2y0j+bpmrH+YlDIk/+DatZJlD8KdJEvlMPpubAQBfw
         XCZP7hvpiXs4CKyt0QZKbixFDESW0b7TC6hnQrQlrSqtGr4Uq1WdkkrNfywUCqG/UjWB
         XUTQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=bX2PBtLa;
       spf=pass (google.com: domain of quintela@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=quintela@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <quintela@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id n3-20020a056402514300b0051879df964bsi3561217edd.25.2023.06.27.00.37.33
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jun 2023 00:37:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of quintela@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=bX2PBtLa;
       spf=pass (google.com: domain of quintela@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=quintela@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1687851452;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+xgQgUPMb1TaJ3VDoJF0EsH3bpnjRmp0el7s7zL4UX4=;
	b=bX2PBtLa8EUXoNCZLQXTjvvNgofu5uoLvVdaAo7H+njm3RSqv17kVNbap3k4RD7mfvmZcl
	1JOGr9EOychUmPq4Ktr9ie78ZRStyhrnz4vbv16pLtMPRAJ9DZcGEvEETlRianVyi5UjLP
	xPqV+CG74T1dRxgLHEdKS+rJsmye388=
Received: from mail-lf1-f70.google.com (mail-lf1-f70.google.com
 [209.85.167.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-628-BiXPksAHO7qx0IR8PqDLyg-1; Tue, 27 Jun 2023 03:37:31 -0400
X-MC-Unique: BiXPksAHO7qx0IR8PqDLyg-1
Received: by mail-lf1-f70.google.com with SMTP id 2adb3069b0e04-4fb89482cd6so42058e87.1
        for <alex.bennee@linaro.org>; Tue, 27 Jun 2023 00:37:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687851449; x=1690443449;
        h=content-transfer-encoding:mime-version:message-id:date:reply-to
         :user-agent:references:in-reply-to:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+xgQgUPMb1TaJ3VDoJF0EsH3bpnjRmp0el7s7zL4UX4=;
        b=cf/8LEMvWKzEU97ipcgrqE45Y0NxAsxGUuBX//eOBwulLSKexJx3w221dSXUf+QoLB
         f/WX0vj1RY1B7RtDnTldD66yuirsKgdgxXQlhYaL4+tZo7NtI54ODBaxIC+k2AC+Q2BT
         KzfZwnGyPu+vk473CeZG46kItjH4lhow6IQvvu96sMwreCd6V8f1BCOqaLbJquHqIYYq
         GkCbFIkFcBxRpf4dr1Ij0trryZB5NeCPbZF26jrKCl3AczT2lpn1mx9G2ZvA2+25Tc5H
         6T0tA9z5Py/XL9HJrDP61lSx8lioUWAFvd7CdYJadAxgeT5edVnXVp16K0C7ARsS3Z5G
         zGJg==
X-Gm-Message-State: AC+VfDwXkbWaevGc70CSTuCMvx/ZnLd71zofgsbNV1eFqoWW/sx0/g+G
	5Ai/2CApTtyYcLsjaufDDueMnDL7AwdMY1S+59QVtEH9x/z+PhT5ah7GvWmcFT4eJOqgIXNREQH
	o8sjE4vSTT6m+KByYHxEjjSgGIoVYBR4U4e5gFw+WlS05pCer0nND7sdZy68xBVlTMaWvZ3Euur
	6InKM=
X-Received: by 2002:a05:6512:684:b0:4f9:b649:23d2 with SMTP id t4-20020a056512068400b004f9b64923d2mr5543601lfe.42.1687851449334;
        Tue, 27 Jun 2023 00:37:29 -0700 (PDT)
X-Received: by 2002:a05:6512:684:b0:4f9:b649:23d2 with SMTP id t4-20020a056512068400b004f9b64923d2mr5543547lfe.42.1687851448754;
        Tue, 27 Jun 2023 00:37:28 -0700 (PDT)
Return-Path: <quintela@redhat.com>
Received: from redhat.com (static-92-120-85-188.ipcom.comunitel.net. [188.85.120.92])
        by smtp.gmail.com with ESMTPSA id f4-20020a1c6a04000000b003fba2734f1esm1136403wmc.1.2023.06.27.00.37.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jun 2023 00:37:27 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org,  Qiuhao Li <Qiuhao.Li@outlook.com>,  Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,  Stefan Hajnoczi
 <stefanha@redhat.com>,
  Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,  Daniel P.
 =?utf-8?Q?Berrang=C3=A9?=
 <berrange@redhat.com>,  Eduardo Habkost <eduardo@habkost.net>,  Alexandre
 Iooss <erdnaxe@crans.org>,  Peter Xu <peterx@redhat.com>,  Yanan Wang
 <wangyanan55@huawei.com>,  Mahmoud Mandour <ma.mandourr@gmail.com>,  Peter
 Maydell <peter.maydell@linaro.org>,  Bin Meng <bmeng.cn@gmail.com>,
  Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,  Beraldo Leal
 <bleal@redhat.com>,  Richard Henderson <richard.henderson@linaro.org>,
  Leif Lindholm <quic_llindhol@quicinc.com>,  Paolo Bonzini
 <pbonzini@redhat.com>,  Thomas Huth <thuth@redhat.com>,  Riku Voipio
 <riku.voipio@iki.fi>,  Cleber Rosa <crosa@redhat.com>,  Alexander Bulekov
 <alxndr@bu.edu>,  Radoslaw Biernacki <rad@semihalf.com>,  Bandan Das
 <bsd@redhat.com>,  Leonardo Bras <leobras@redhat.com>,
  qemu-arm@nongnu.org,  Darren Kenny <darren.kenny@oracle.com>,  Wainer dos
 Santos Moschetta <wainersm@redhat.com>,  Laurent Vivier
 <lvivier@redhat.com>
Subject: Re: [PATCH v2 6/6] qemu-keymap: properly check return from
 xkb_keymap_mod_get_index
In-Reply-To: <20230626202516.2507915-7-alex.bennee@linaro.org> ("Alex
	=?utf-8?Q?Benn=C3=A9e=22's?= message of "Mon, 26 Jun 2023 21:25:15 +0100")
References: <20230626202516.2507915-1-alex.bennee@linaro.org>
	<20230626202516.2507915-7-alex.bennee@linaro.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Reply-To: quintela@redhat.com
Date: Tue, 27 Jun 2023 09:37:27 +0200
Message-ID: <87o7l1cq4o.fsf@secure.mitica>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: YO/SYm2FCw3i

Alex Benn=C3=A9e <alex.bennee@linaro.org> wrote:
> We can return XKB_MOD_INVALID which rightly gets flagged by sanitisers
> as an overly wide shift attempt.
>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

Reviewed-by: Juan Quintela <quintela@redhat.com>
