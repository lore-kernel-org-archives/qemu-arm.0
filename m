Received: by 10.25.159.19 with SMTP id i19csp1285246lfe;
        Mon, 25 Jan 2016 06:41:18 -0800 (PST)
X-Received: by 10.28.178.206 with SMTP id b197mr17623095wmf.72.1453732878695;
        Mon, 25 Jan 2016 06:41:18 -0800 (PST)
Return-Path: <eric.auger@linaro.org>
Received: from mail-wm0-x230.google.com (mail-wm0-x230.google.com. [2a00:1450:400c:c09::230])
        by mx.google.com with ESMTPS id q134si24785467wmb.96.2016.01.25.06.41.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 25 Jan 2016 06:41:18 -0800 (PST)
Received-SPF: pass (google.com: domain of eric.auger@linaro.org designates 2a00:1450:400c:c09::230 as permitted sender) client-ip=2a00:1450:400c:c09::230;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of eric.auger@linaro.org designates 2a00:1450:400c:c09::230 as permitted sender) smtp.mailfrom=eric.auger@linaro.org;
       dkim=pass header.i=@linaro.org
Received: by mail-wm0-x230.google.com with SMTP id n5so83275542wmn.0
        for <alex.bennee@linaro.org>; Mon, 25 Jan 2016 06:41:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:references:cc:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-type:content-transfer-encoding;
        bh=DF9dDXuVQgyWPNlwQVZiiiCzB/cvF3JpyTRRNBknpWc=;
        b=fdrl+0W3o4/nh7ZoXNm6ANSsgjtejn++72ajT7mnXO/O/FgTDZIqf1W8W7uTX6uAwi
         eKgmFn2DVbOyjbGO5hX+84MFZSew1qpPM+sUzNqO7QvjwtUjMJzCqi9rA5qk+vTu5djD
         NpApWD+3vuBa3s184z8w1yKdgyRvOSzMT0MLQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20130820;
        h=x-gm-message-state:subject:to:references:cc:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-type
         :content-transfer-encoding;
        bh=DF9dDXuVQgyWPNlwQVZiiiCzB/cvF3JpyTRRNBknpWc=;
        b=cIzR33uX+3g6skxcRqVm/WAw3NMaaix/3ucJuu4UmzQr4w0/aHau9da6XVTA9VDJpr
         r8hQ4qWUEYSQqzrt+b1SdJc5E4xPUHHg84OS2q1519aOVc2vv6+fGcbBgLo1KjodxEN8
         IANbykL0fMQ1Y1dnGCL7XC/8LKVTdp2BJmVjkooSblk+5nJU+tATXpI2rvEVedEpxr4r
         h0W7/hvbe3BCzNukRGbwkHlNU8lSGILzZq3Tz+318QW7Q9eyJetDpziCCWDlOPQxkrq3
         qC0gBPj9RiwMLTjCs/uNLMwR4FiFkw7ohR7vgz6SgzF+oCbiOzhk8+mrD5j0n0GTkjy0
         kpxA==
X-Gm-Message-State: AG10YOTiSixc7G3DkYRi/qubqxK/+wrsSHG3YBjRHbShfEBiOs9OM+wj6TFfF9qbV9abTyUeAKU=
X-Received: by 10.195.17.198 with SMTP id gg6mr17500366wjd.15.1453732878449;
        Mon, 25 Jan 2016 06:41:18 -0800 (PST)
Return-Path: <eric.auger@linaro.org>
Received: from [192.168.2.12] (LMontsouris-657-1-37-90.w80-11.abo.wanadoo.fr. [80.11.198.90])
        by smtp.googlemail.com with ESMTPSA id 73sm16520168wmm.7.2016.01.25.06.41.16
        (version=TLSv1/SSLv3 cipher=OTHER);
        Mon, 25 Jan 2016 06:41:17 -0800 (PST)
Subject: Re: [PATCH v5 3/8] device_tree: introduce qemu_fdt_node_path
To: Peter Maydell <peter.maydell@linaro.org>
References: <1453130204-655-1-git-send-email-eric.auger@linaro.org>
 <1453130204-655-4-git-send-email-eric.auger@linaro.org>
 <CAFEAcA8xCQ2XaYvFXLFK8S89vWaBmoExmDq42WQzj3QOw86Ayg@mail.gmail.com>
Cc: eric.auger@st.com, QEMU Developers <qemu-devel@nongnu.org>,
 qemu-arm <qemu-arm@nongnu.org>, David Gibson <david@gibson.dropbear.id.au>,
 Alex Williamson <alex.williamson@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Peter Crosthwaite <crosthwaitepeter@gmail.com>,
 Patch Tracking <patches@linaro.org>,
 Christoffer Dall <christoffer.dall@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Baptiste Reynal <b.reynal@virtualopensystems.com>,
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
 thomas.lendacky@amd.com
From: Eric Auger <eric.auger@linaro.org>
Message-ID: <56A633FC.3020609@linaro.org>
Date: Mon, 25 Jan 2016 15:41:00 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
 Thunderbird/38.5.1
MIME-Version: 1.0
In-Reply-To: <CAFEAcA8xCQ2XaYvFXLFK8S89vWaBmoExmDq42WQzj3QOw86Ayg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-TUID: XNLW/NjYDo5d

Peter,
On 01/25/2016 03:26 PM, Peter Maydell wrote:
> On 18 January 2016 at 15:16, Eric Auger <eric.auger@linaro.org> wrote:
>> This new helper routine returns a NULL terminated array of
>> node paths matching a node name and a compat string.
>>
>> Signed-off-by: Eric Auger <eric.auger@linaro.org>
>>
>> ---
>>
>> v4 -> v5:
>> - support the case where several nodes exist, ie.
>>   return an array of node paths. Also add Error **
>>   parameter
>>
>> v1 -> v2:
>> - move doc comment in header file
>> - do not use a fixed size buffer
>> - break on errors in while loop
>> - use strcmp instead of strncmp
>>
>> RFC -> v1:
>> - improve error handling according to Alex' comments
>> ---
>>  device_tree.c                | 49 ++++++++++++++++++++++++++++++++++++++++++++
>>  include/sysemu/device_tree.h | 14 +++++++++++++
>>  2 files changed, 63 insertions(+)
>>
>> diff --git a/device_tree.c b/device_tree.c
>> index b262c2d..3c88a37 100644
>> --- a/device_tree.c
>> +++ b/device_tree.c
>> @@ -231,6 +231,55 @@ static int findnode_nofail(void *fdt, const char *node_path)
>>      return offset;
>>  }
>>
>> +char **qemu_fdt_node_path(void *fdt, const char *name, char *compat,
>> +                          Error **errp)
>> +{
>> +    int offset, len, ret;
>> +    const char *iter_name;
>> +    unsigned int path_len = 16, n = 0;
>> +    GSList *path_list = NULL, *iter;
>> +    char **path_array;
>> +
>> +    offset = fdt_node_offset_by_compatible(fdt, -1, compat);
>> +
>> +    while (offset >= 0) {
>> +        iter_name = fdt_get_name(fdt, offset, &len);
>> +        if (!iter_name) {
>> +            offset = len;
>> +            break;
>> +        }
>> +        if (!strcmp(iter_name, name)) {
>> +            char *path;
>> +
>> +            path = g_malloc(path_len);
>> +            while ((ret = fdt_get_path(fdt, offset, path, path_len))
>> +                  == -FDT_ERR_NOSPACE) {
>> +                path_len += 16;
>> +                path = g_realloc(path, path_len);
>> +            }
>> +            path_list = g_slist_prepend(path_list, path);
>> +            n++;
>> +        }
>> +        offset = fdt_node_offset_by_compatible(fdt, offset, compat);
>> +    }
>> +
>> +    if (offset < 0 && offset != -FDT_ERR_NOTFOUND) {
>> +        error_setg(errp, "%s: abort parsing dt for %s/%s: %s",
>> +                   __func__, name, compat, fdt_strerror(offset));
> 
> Needs to bail out (freeing memory).
effectively in case I get an error, it's better to free everything and
return a vector with with a single NULL element, see comment below. I
will correct this.
> 
>> +    }
>> +
>> +    path_array = g_new(char *, n + 1);
>> +    path_array[n--] = NULL;
> 
> 0, or '\0'. NULL is a pointer, not the NUL character. (This is a
> style issue, not a correctness one.)
actually I want to put NULL as the last element of my array and not a
NUL char. The function returns a NULL terminated vector as
g_strsplit_set does, for instance.

Thanks

Eric
> 
>> +
>> +    for (iter = path_list; iter; iter = iter->next) {
>> +        path_array[n--] = iter->data;
>> +    }
>> +
>> +    g_slist_free(path_list);
>> +
>> +    return path_array;
>> +}
>> +
>>  int qemu_fdt_setprop(void *fdt, const char *node_path,
>>                       const char *property, const void *val, int size)
>>  {
>> diff --git a/include/sysemu/device_tree.h b/include/sysemu/device_tree.h
>> index fdf25a4..436b5dd 100644
>> --- a/include/sysemu/device_tree.h
>> +++ b/include/sysemu/device_tree.h
>> @@ -20,6 +20,20 @@ void *load_device_tree(const char *filename_path, int *sizep);
>>  void *load_device_tree_from_sysfs(void);
>>  #endif
>>
>> +/**
>> + * qemu_fdt_node_path: return the paths of nodes matching a given
>> + * name and compat string
>> + * @fdt: pointer to the dt blob
>> + * @name: node name
>> + * @compat: compatibility string
>> + * @errp: handle to an error object
>> + *
>> + * returns a newly allocated NULL-terminated array of node paths.
> 
> Should say what we return on error (NULL ?)
> 
>> + * Use g_strfreev() to free it.
>> + */
>> +char **qemu_fdt_node_path(void *fdt, const char *name, char *compat,
>> +                          Error **errp);
>> +
>>  int qemu_fdt_setprop(void *fdt, const char *node_path,
>>                       const char *property, const void *val, int size);
>>  int qemu_fdt_setprop_cell(void *fdt, const char *node_path,
>> --
>> 1.9.1
>>
> 
> thanks
> -- PMM
> 
